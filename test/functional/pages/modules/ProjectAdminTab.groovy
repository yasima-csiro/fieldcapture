package pages.modules

import geb.Module
import pages.modules.AdminDocumentsTab
import pages.modules.AdminProjectSettingsTab

class ProjectAdminTab extends Module {
    static content = {

        projectSettingsTab {$('#settings-tab')}
        meriPlanTab {$('#projectDetails-tab')}
        newsAndEventsTab {$('#editNewsAndEvents-tab')}
        projectStoriesTab {$('#editProjectStories-tab')}
        projectAccessTab {$('#permissions-tab')}
        speciesOfInterestTab { $('#species-tab') }
        documentsTab { $('#edit-documents-tab') }

        documents { module AdminDocumentsTab }
        projectSettings { module AdminProjectSettingsTab }

    }
}