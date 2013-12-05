package au.org.ala.fieldcapture

import grails.converters.JSON

class HomeController {

    def projectService
    def siteService
    def activityService
    def searchService
    def settingService

    @PreAuthorise(accessLevel = 'siteAdmin', redirectController = "admin")
    def advanced() {
        [
            projects: projectService.list(),
            sites: siteService.list(),
            //sites: siteService.injectLocationMetadata(siteService.list()),
            activities: activityService.list(),
            assessments: activityService.assessments(),
        ]
    }
    def index() {
        params.facets = "associatedProgramFacet,associatedSubProgramFacet,fundingSourceFacet,reportingThemesFacet,organisationFacet,statesFacet,nrmsFacet,lgasFacet"
        def resp = searchService.HomePageFacets(params)
        [ facetsList: params.facets.tokenize(","),
          results: resp ]
    }

    def tabbed() {
        [ geoPoints: searchService.allGeoPoints(params) ]
    }

    def geoService() {
        params.max = params.max?:9999
        if(params.geo){
            render searchService.allProjectsWithSites(params) as JSON
        } else {
            render searchService.allProjects(params) as JSON
        }
    }

    def getProjectsForIds() {
        render searchService.getProjectsForIds(params) as JSON
    }

    def myProfile() {
        redirect(controller: 'user')
    }

    def about() {
        def settingType = SettingPageType.ABOUT
        def content = settingService.getSettingText(settingType)
        [name: settingType.name, title: settingType.title, content: content]
    }

    def help() {
        def settingType = SettingPageType.HELP
        def content = settingService.getSettingText(settingType)
        render view: 'about', model: [name: settingType.name, title: settingType.title, content: content]
    }

    def contacts() {
        def settingType = SettingPageType.CONTACTS
        def content = settingService.getSettingText(settingType)
        render view: 'about', model: [name: settingType.name, title: settingType.title, content: content]
    }
}
