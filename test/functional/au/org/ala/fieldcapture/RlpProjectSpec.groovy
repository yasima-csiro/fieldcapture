package au.org.ala.fieldcapture

import pages.RlpProjectPage
import spock.lang.Stepwise

@Stepwise
class RlpProjectSpec extends StubbedCasSpec {

    def setup() {
        useDataSet('dataset2')
    }

    def cleanup() {
        println "Logout"
        logout(browser)
        println "Logged out"
    }


    def "the project details are displayed correctly on the overview tab"() {

        setup:
        String projectId = '1'
        login([userId: '2', role: "ROLE_FC_OFFICER", email: 'admin@nowhere.com', firstName: "MERIT", lastName: 'FC_ADMIN'], browser)

        when:
        to RlpProjectPage, projectId

        then:
        waitFor { at RlpProjectPage }

        and: "All of the project tabs are visible as I am a FC_OFFICER"
        overviewTab.displayed == true
        dashboardTab.displayed == true
        documentsTab.displayed == true
        meriPlanTab.displayed == true
        sitesTab.displayed == true
        reportingTab.displayed == true
        adminTab.displayed == true

        and: "The content on the overview tab is correct"
        name.text() == 'Project 1'
        overview.description.text() == 'Project 1 description'
        overview.program.text() == 'Test program'
        overview.managementUnit.text() == 'Test management unit'
        overview.serviceProvider.text() == 'Test Org'
        overview.projectId.text() == 'RLP-Test-Program-Project-1'
        overview.status.text() == 'ACTIVE'
        overview.projectStart.text() == '01-07-2018'
        overview.projectEnd.text() == '01-07-2023'
        overview.funding.text() == '$100,000.00'
        overview.orderNumber.text() == '1234565'

    }

    def "All tabs are visible to FC_OFFICERS"() {

        setup:
        String projectId = '1'
        login([userId: '2', role: "ROLE_FC_OFFICER", email: 'admin@nowhere.com', firstName: "MERIT", lastName: 'FC_OFFICER'], browser)
        println "Logged in"

        when:
        to RlpProjectPage, projectId

        then:
        waitFor { at RlpProjectPage }

        and:
        overviewTab.displayed == true
        dashboardTab.displayed == true
        documentsTab.displayed == true
        meriPlanTab.displayed == true
        sitesTab.displayed == true
        reportingTab.displayed == true
        adminTab.displayed == true
    }


    def "Only the overview tab and document tab are displayed to un-authenticated users"() {

        setup:
        logout(browser)
        String projectId = '1'
        println "No login!"

        when:
        to RlpProjectPage, projectId

        then:
        waitFor { at RlpProjectPage }

        and:
        overviewTab.displayed == true
        dashboardTab.empty == true
        documentsTab.displayed == true
        meriPlanTab.empty == true
        sitesTab.empty == true
        reportingTab.empty == true
        adminTab.empty == true
    }

    def "Only the overview tab and document tab are displayed to non-project members users"() {

        setup:
        String projectId = '1'
        login([userId: '100', role: "ROLE_USER", email: 'admin@nowhere.com', firstName: "MERIT", lastName: 'Admin'], browser)

        when:
        to RlpProjectPage, projectId

        then:
        waitFor { at RlpProjectPage }

        and:
        overviewTab.displayed == true
        dashboardTab.empty == true
        documentsTab.displayed == true
        meriPlanTab.empty == true
        sitesTab.empty == true
        reportingTab.empty == true
        adminTab.empty == true
    }

    def "All tabs are visible to project admins"() {

        setup: "user 1 is an admin for project 1"
        String projectId = '1'
        login([userId: '1', role: "ROLE_USER", email: 'admin@nowhere.com', firstName: "MERIT", lastName: 'Admin'], browser)

        when:
        to RlpProjectPage, projectId

        then:
        waitFor { at RlpProjectPage }

        and:
        overviewTab.displayed == true
        dashboardTab.displayed == true
        documentsTab.displayed == true
        meriPlanTab.displayed == true
        sitesTab.displayed == true
        reportingTab.displayed == true
        adminTab.displayed == true
    }

    def "All tabs are visible to project editors"() {

        setup: "user 10 is an editor for project 1"
        String projectId = '1'
        login([userId: '10', role: "ROLE_USER", email: 'admin@nowhere.com', firstName: "MERIT", lastName: 'Admin'], browser)

        when:
        to RlpProjectPage, projectId

        then:
        waitFor { at RlpProjectPage }

        and:
        overviewTab.displayed == true
        dashboardTab.displayed == true
        documentsTab.displayed == true
        meriPlanTab.displayed == true
        sitesTab.displayed == true
        reportingTab.displayed == true
        adminTab.displayed == true
    }



}