package au.org.ala.fieldcapture

import pages.AdminTools
import pages.ProjectExplorer
import spock.lang.Stepwise

@Stepwise
class ProjectExplorerSpec extends StubbedCasSpec {

    void setup() {
        useDataSet('dataset2')
    }

    void "The project explorer displays a list of projects"() {

        setup:
        login([userId: '2', role: "ROLE_ADMIN", email: 'admin@nowhere.com', firstName: "MERIT", lastName: 'ALA_ADMIN'], browser)

        when:
        to AdminTools

        then:
        at AdminTools

        when: "Reindex to ensure the project explorer will have predictable data"
        reindex()
        logout(browser)

        boolean empty = true
        while (empty) {
            to ProjectExplorer
            empty = emptyIndex()
        }


        then: "The downloads accordion is not visible to unauthenticated users"
        Thread.sleep(2000) // there are some animations that make this difficult to do waiting on conditions.
        downloadsToggle.empty == true

        when: "collapse the map section"
        waitFor {
            map.displayed
        }
        mapToggle.click()

        then:
        waitFor { map.displayed == false }

        when: "expand the projects section"
        projectsToggle.click()
        waitFor { projectPagination.displayed }

        then:
        waitFor 20, {

            to ProjectExplorer
            waitFor { projectPagination.displayed }

            println(projects.size())
            projects.size() == 9
        }

        new HashSet(projects.collect{it.name}) == new HashSet((1..9).collect{"Project $it"})

    }
}