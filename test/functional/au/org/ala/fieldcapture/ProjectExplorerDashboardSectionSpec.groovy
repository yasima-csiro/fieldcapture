package au.org.ala.fieldcapture

import pages.AdminTools
import pages.ProjectExplorer

class ProjectExplorerDashboardSectionSpec extends StubbedCasSpec {

    void setup(){
        useDataSet("data_static_score")
    }

    void cleanup() {
        logout(browser)
    }

    def "The Project Explorer Dashboard display the output programme  and activity"(){

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
        if(map.displayed == true){
            waitFor {
                map.displayed
            }
            mapToggle.click()
        }

        then:
        waitFor { map.displayed == false }
        dashboardToggle.click()
        waitFor {reportView.displayed}
        waitFor (5){dashboardContent.displayed}


        and:
        waitFor {dashboardContentList.size() == 3}
    }

}
