package au.org.ala.fieldcapture


import pages.RlpProjectPage

class ConfigurableMeriPlanSpec extends StubbedCasSpec {

    def setupSpec() {
        useDataSet('dataset3')
    }

    def cleanup() {
        logout(browser)
    }

    def "The MERI Plan will display only sections specified in the program configuration"() {

        setup:
        String projectId = 'p3'
        login([userId: '1', role: "ROLE_USER", email: 'admin@nowhere.com', firstName: "MERIT", lastName: 'USER'], browser)

        when:
        to RlpProjectPage, projectId

        then:
        waitFor { at RlpProjectPage }

        when:
        def meriPlan = openMeriPlanEditTab()

        then: "Only the sections of the MERI plan configured in the program will be displayed"
        meriPlan != null
        !meriPlan.primaryOutcome.displayed
        !meriPlan.primaryPriority.displayed
        !meriPlan.secondaryOutcomes.displayed
        !meriPlan.shortTermOutcomes.displayed
        !meriPlan.mediumTermOutcomes.displayed
        !meriPlan.projectName.displayed
        !meriPlan.projectDescription.displayed
        !meriPlan.projectMethodology.displayed
        !meriPlan.projectBaseline.displayed
        !meriPlan.reviewMethodology.displayed
        !meriPlan.nationalAndRegionalPlans.displayed
        !meriPlan.projectServices.displayed
        meriPlan.objectivesList.displayed
        meriPlan.monitoringIndicators.displayed
        meriPlan.projectImplementation.displayed
        meriPlan.projectPartnerships.displayed
        meriPlan.keq.displayed
        meriPlan.budget.displayed

        and: "The objectives specified in the program are available for selection"
        meriPlan.availableObjectives() == ['objective 1', 'objective 2', 'objective 3']

        when:
        meriPlan.checkObjective("objective 2")
        meriPlan.monitoringIndicators[0].indicator = "indicator 1"
        meriPlan.monitoringIndicators[0].approach = "approach 1"
        meriPlan.projectImplementation = "project implementation"
        meriPlan.projectPartnerships[0].name = 'partner name'
        meriPlan.projectPartnerships[0].partnership = 'partnership'
        meriPlan.projectPartnerships[0].orgType = 'Trust'
        meriPlan.keq[0].question = 'keq 1'
        meriPlan.keq[0].monitoring = 'keq monitoring 1'
        meriPlan.budget[0].area = 'MERI & Admin'
        meriPlan.budget[0].description = 'budget description'
        meriPlan.budget[0].budgetAmounts[0].value('100')
        meriPlan.save()

        def previousLoad = getAtCheckTime()
        to RlpProjectPage, projectId

        then:
        waitFor { getAtCheckTime() > previousLoad }

        when:
        meriPlan = openMeriPlanEditTab()

        then:
        meriPlan.checkedObjectives() == ['objective 2']
        meriPlan.monitoringIndicators[0].indicator == "indicator 1"
        meriPlan.monitoringIndicators[0].approach == "approach 1"
        meriPlan.projectImplementation == "project implementation"
        meriPlan.projectPartnerships[0].name == 'partner name'
        meriPlan.projectPartnerships[0].partnership == 'partnership'
        meriPlan.projectPartnerships[0].orgType == 'Trust'
        meriPlan.keq[0].question == 'keq 1'
        meriPlan.keq[0].monitoring == 'keq monitoring 1'
        meriPlan.budget[0].area == 'MERI & Admin'
        meriPlan.budget[0].description == 'budget description'
        meriPlan.budget[0].budgetAmounts[0].value() == '100'
        meriPlan.budget[0].total.text() == '$100.00'

    }

    def "The MERI Plan will display only sections specified in state intervention config for state intervention projects"() {
        setup:
        String projectId = 'meri2'
        login([userId: '1', role: "ROLE_USER", email: 'admin@nowhere.com', firstName: "MERIT", lastName: 'USER'], browser)

        when:
        to RlpProjectPage, projectId

        then:
        waitFor { at RlpProjectPage }

        when:
        def meriPlan = openMeriPlanEditTab()

        then:
        then: "Only the sections of the MERI plan configured in the program will be displayed"
        meriPlan != null
        !meriPlan.primaryOutcome.displayed
        !meriPlan.primaryPriority.displayed
        !meriPlan.secondaryOutcomes.displayed
        !meriPlan.mediumTermOutcomes.displayed
        !meriPlan.projectName.displayed
        !meriPlan.projectBaseline.displayed
        !meriPlan.reviewMethodology.displayed
        !meriPlan.nationalAndRegionalPlans.displayed
        !meriPlan.projectServices.displayed
        !meriPlan.projectImplementation.displayed
        !meriPlan.keq.displayed
        !meriPlan.budget.displayed
        meriPlan.assets.displayed
        meriPlan.objectivesList.displayed
        meriPlan.shortTermOutcomes.displayed
        meriPlan.projectMethodology.displayed
        meriPlan.projectDescription.displayed
        meriPlan.monitoringIndicators.displayed
        meriPlan.adaptiveManagement.displayed
        meriPlan.projectPartnerships.displayed
        meriPlan.activities.displayed

        meriPlan.availableObjectives() == ['objective 1', 'objective 2', 'objective 3', 'Other']

        when:
        meriPlan.assets[0].description = "asset 1"
        meriPlan.checkObjective("objective 2")
        meriPlan.checkObjective("Other")
        waitFor{!meriPlan.otherObjective.@readonly}
        meriPlan.otherObjective = "Other objective"
        meriPlan.shortTermOutcomes[0].value("outcome 1")
        meriPlan.projectDescription = 'Project description'
        meriPlan.projectMethodology = 'Project Methodology'
        meriPlan.monitoringIndicators[0].indicator.value("Indicator 1")
        meriPlan.monitoringIndicators[0].approach.value('Approach 1')
        meriPlan.adaptiveManagement = 'Adaptive management'
        meriPlan.projectPartnerships[0].name = 'partner name'
        meriPlan.projectPartnerships[0].partnership = 'partnership'
        meriPlan.projectPartnerships[0].orgType = 'Trust'
        meriPlan.hideFloatingSave() // if we don't do that we can't click on the activity

        meriPlan.checkActivity('activity 1')
        meriPlan.checkActivity('Other')
        waitFor{!meriPlan.otherActivity.@readonly}
        meriPlan.otherActivity = 'Other activity'
        meriPlan.save()

        def previousLoad = getAtCheckTime()
        to RlpProjectPage, projectId

        then:
        waitFor { getAtCheckTime() > previousLoad }

        when:
        meriPlan = openMeriPlanEditTab()

        then:
        meriPlan.assets[0].description == "asset 1"
        meriPlan.checkedObjectives() == ["objective 2", 'Other']
        meriPlan.otherObjective == "Other objective"
        meriPlan.shortTermOutcomes[0].value() == "outcome 1"
        meriPlan.projectDescription == 'Project description'
        meriPlan.projectMethodology == 'Project Methodology'
        meriPlan.monitoringIndicators[0].indicator.value() == "Indicator 1"
        meriPlan.monitoringIndicators[0].approach.value() == 'Approach 1'
        meriPlan.adaptiveManagement == 'Adaptive management'
        meriPlan.projectPartnerships[0].name == 'partner name'
        meriPlan.projectPartnerships[0].partnership == 'partnership'
        meriPlan.projectPartnerships[0].orgType == 'Trust'
        meriPlan.checkedActivities() == ["activity 1", 'Other']
        meriPlan.otherActivity == "Other activity"
    }

}