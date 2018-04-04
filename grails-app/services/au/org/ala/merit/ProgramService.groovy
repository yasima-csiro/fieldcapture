package au.org.ala.merit;

import org.codehaus.groovy.grails.commons.GrailsApplication

import java.util.Map

class ProgramService {

    private static final String PROGRAM_DOCUMENT_FILTER = "className:au.org.ala.ecodata.Program"

    GrailsApplication grailsApplication
    WebService webService
    MetadataService metadataService
    ProjectService projectService
    UserService userService
    SearchService searchService


    Map get(String id, String view = '') {
        def url = "${grailsApplication.config.ecodata.baseUrl}program/" + id + "?view=" + view.encodeAsURL()
        webService.getJson(url)
    }

    Map getByName(String name) {

        String url = "${grailsApplication.config.ecodata.baseUrl}program/?name=" + name.encodeAsURL()
        Map program = webService.getJson(url)

        if(program && program.statusCode == 404) {
            program = [:]
        }

        return program
    }

    String validate(Map props, String programId) {
        String error = null
        boolean creating = !programId

        if (!creating) {
            Map existingProgram = get(programId)
            if (existingProgram?.error) {
                return "invalid programId"
            }
        }

        if (creating && !props?.description) {
            //error, no description
            return "description is missing"
        }

        if (props.containsKey("name")) {
            Map existingProgram = getByName(props.name)
            if ((existingProgram as Boolean) && (creating || existingProgram?.programId != programId)) {
                return "name is not unique"
            }
        } else if (creating) {
            //error, no project name
            return "name is missing"
        }

        error
    }

    Map update(String id, Map program) {
        Map result = [:]

        def error = validate(program, id)
        if (error) {
            result.error = error
            result.detail = ''
        } else {
            String url = "${grailsApplication.config.ecodata.baseUrl}program/$id"
            result = webService.doPost(url, program)
        }
        result

    }

}
