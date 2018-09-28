package au.org.ala.merit

import au.org.ala.merit.command.SaveReportDataCommand
import grails.test.mixin.TestFor
import org.apache.http.HttpStatus
import spock.lang.Specification

@TestFor(ProgramController)
class ProgramControllerSpec extends Specification {

    ProgramService programService = Mock(ProgramService)
    ReportService reportService = Mock(ReportService)
    UserService userService = Mock(UserService)
    ActivityService activityService = Mock(ActivityService)

    String adminUserId = 'admin'
    String editorUserId = 'editor'
    String grantManagerUserId = 'grantManager'

    def setup() {
        controller.programService = programService
        controller.reportService = reportService
        controller.activityService = activityService
    }

    def "when viewing a program report, the model will be customized for program reporting"() {
        setup:
        setupProgramAdmin()
        String programId = 'p1'
        String reportId = 'r1'
        Map program = testProgram(programId, true)

        when:
        controller.viewReport(programId, reportId)

        then:
        1 * reportService.activityReportModel(reportId, ReportService.ReportMode.VIEW) >> [:]
        view == '/activity/activityReportView'
        model.context == program
        model.contextViewUrl == '/program/index/'+programId
        model.reportHeaderTemplate == '/program/rlpProgramReportHeader'
    }

    def "when editing a program report, the model will be customized for program reporting"() {
        setup:
        setupProgramAdmin()
        String programId = 'p1'
        String reportId = 'r1'
        Map program = testProgram(programId, true)

        when:
        controller.editReport(programId, reportId)
        then:
        1 * reportService.activityReportModel(reportId, ReportService.ReportMode.EDIT) >> [editable:true]
        view == '/activity/activityReport'
        model.context == program
        model.contextViewUrl == '/program/index/'+programId
        model.reportHeaderTemplate == '/program/rlpProgramReportHeader'
    }

    def "if a report is not editable, the program controller should present the report view instead"() {
        setup:
        setupProgramAdmin()
        String programId = 'p1'
        String reportId = 'r1'
        Map program = testProgram(programId, true)
        program.inheritedConfig.requiresActivityLocking = true

        when:
        reportService.activityReportModel(reportId, ReportService.ReportMode.EDIT) >> [editable:false]
        controller.editReport(programId, reportId)

        then: "the report activity should not be locked"
        0 * reportService.lockForEditing(_)

        and: "the user should be redirected to the report view"
        response.redirectUrl == '/program/viewReport/'+programId+"?reportId="+reportId+"&attemptedEdit=true"
    }

    def "if the program uses pessimistic locking for reports, the report activity should be locked when the report is edited"() {
        setup:
        setupProgramAdmin()
        String programId = 'p1'
        String reportId = 'r1'
        Map program = testProgram(programId, true)

        when:
        program.inheritedConfig.requiresActivityLocking = true
        controller.editReport(programId, reportId)
        then:
        1 * reportService.activityReportModel(reportId, ReportService.ReportMode.EDIT) >> [report:program.reports[0], editable:true]
        1 * reportService.lockForEditing(program.reports[0])
        view == '/activity/activityReport'
    }

    def "report data shouldn't be saved if the project id of the report doesn't match the project id checked by the annotation"() {
        setup:
        Map props = [
                activityId:'a1',
                activity:[
                        test1:'test'
                ],
                reportId:'r1',
                reportService:reportService,
                activityService: activityService

        ]
        reportService.get(props.reportId) >> [programId:'p2']
        SaveReportDataCommand cmd = new SaveReportDataCommand(props)

        when:
        params.projectId = 'p1'
        controller.saveReport(cmd)

        then:
        response.json.error != null
        response.json.status == HttpStatus.SC_UNAUTHORIZED
    }



    private Map testProgram(String id, boolean includeReports) {
        Map program = [programId:id, name:'name', config:[:], inheritedConfig:[:]]
        if (includeReports) {
            program.reports = [[type:'report1', reportId:'r1', activityId:'a1'], [type:'report1', reportId:'r2', activityId:'a2']]
        }
        programService.get(id) >> program
        userService.getMembersOfProgram() >> [
                [userId:adminUserId, role:RoleService.PROJECT_ADMIN_ROLE],
                [userId:editorUserId, role:RoleService.PROJECT_EDITOR_ROLE],
                [userId:grantManagerUserId, role:RoleService.GRANT_MANAGER_ROLE]]
        return program
    }

    private void setupAnonymousUser() {
        userService.getUser() >> null
        userService.userHasReadOnlyAccess() >> false
        userService.userIsSiteAdmin() >> false
        userService.userIsAlaOrFcAdmin() >> false
    }


    private void setupProgramAdmin() {
        def userId = adminUserId
        userService.getUser() >> [userId:userId]
        userService.userHasReadOnlyAccess() >> false
        userService.userIsSiteAdmin() >> false
        userService.userIsAlaOrFcAdmin() >> false
    }

}