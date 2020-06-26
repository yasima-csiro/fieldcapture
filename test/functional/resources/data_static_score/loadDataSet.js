print("This script is expected to be executed with a working directory containing this script");
print("Current working dir: "+pwd());
load('../data_common/loadMeritHub.js');
load('../data_common/insertData.js');

createProject({name:'project 1', projectId:"project_1", programId:'program_1',managementUnitId:"mu_1", grantId:"RLP-Test-Program-Project-1",
    outputTargets:[
        {"outputLabel":"Weed Treatment Details",
            "scoreName":"areaTreatedHa",
            "target":"10",
            "unit":"Ha",
            "scoreLabel":"Total new area treated for weeds (Ha)",
            "scoreId":"score_1"
        }
        ]
});

createProject({name:'project 2', projectId:"project_2", programId:'program_2',managementUnitId:"mu_2", grantId:"RLP-Test-Program-Project-2",
    outputTargets:[
        {"outputLabel":"Weed Treatment Details",
            "scoreName":"areaTreatedHa",
            "target":"10",
            "unit":"Ha",
            "scoreLabel":"Total new area treated for weeds (Ha)",
            "scoreId":"score_1"
        }
    ]
});
createProject({name:'project 3', projectId:"project_3", programId:'program_3',managementUnitId:"mu_3", grantId:"RLP-Test-Program-Project-3",
    outputTargets:[
        {"outputLabel":"Weed Treatment Details",
            "scoreName":"areaTreatedHa",
            "target":"10","unit":"Ha",
            "scoreLabel":"Total new area treated for weeds (Ha)",
            "scoreId":"score_1"
        }
    ]
});


createProject({name:'project 4', projectId:"project_4", programId:'program_1',managementUnitId:"mu_1", grantId:"RLP-Test-Program-Project-1",
    outputTargets:[
        {"outputLabel":"Pest Management Details",
            "target":"600",
            "scoreLabel":"Area covered (Ha) by pest treatment actions",
            "scoreId":"score_4",
            "scoreName":"totalAreaTreatedHa",
            "unit":"Ha",
        }
    ],
    custom:{"details":{"objectives" : {
                "rows1" : [
                    {
                        "assets" : [
                            "Natural/Cultural assets managed",
                            "Threatened Species",
                            "Threatened Ecological Communities",
                            "World Heritage area",
                            "Community awareness/participation in NRM",
                            "Remnant Vegetation"
                        ],
                        "description" : "By June 2018, engage 170 individuals (including Indigenous members) towards NRM awareness and skills relating to Ramsar and World Heritage areas, EPBC species and communities as measured by engagement evaluations (Strategic Objective 3)\n"
                    },
                    {
                        "assets" : [
                            "Natural/Cultural assets managed",
                            "Threatened Species",
                            "Threatened Ecological Communities",
                            "World Heritage area",
                            "Community awareness/participation in NRM",
                            "Remnant Vegetation"
                        ],
                        "description" : "By 2018, implement actions towards 30 Ha of improved habitat in 1 inland Ramsar site and World Heritage areas, and implement recovery actions for 10 EPBC listed flora species or communities as measured by partner evaluations and Natural Values Atlas data entry. (Strategic objective 4)"
                    }
                ]}},
        "budget" : {"headers" : [],
            "columnTotal" : [],
            "rows" : [
                {
                    "shortLabel" : "Farmers and fishers are increasing their long term returns through better management of the natural resource base",
                    "description" : "Community grants",
                    "rowTotal" : 212500,
                    "costs" : [
                        {
                            "dollar" : "25000"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "0"
                        }
                    ]
                }]}},
    associatedProgram : "National Landcare Programme",
    associatedSubProgram : "Regional Funding",
    planStatus: "approved"
});
createProject({name:'project 5', projectId:"project_5", programId:'program_1',managementUnitId:"mu_1", grantId:"RLP-Test-Program-Project-1",
    outputTargets:[
        {"outputLabel":"Pest Management Details",
            "target":"600",
            "scoreLabel":"Area covered (Ha) by pest treatment actions",
            "scoreId":"score_4",
            "scoreName":"totalAreaTreatedHa",
            "unit":"Ha",
        }
    ],    custom:{"details":{"objectives" : {
                "rows1" : [
                    {
                        "assets" : [
                            "Natural/Cultural assets managed",
                            "Threatened Species",
                            "Threatened Ecological Communities",
                            "World Heritage area",
                            "Community awareness/participation in NRM",
                            "Remnant Vegetation"
                        ],
                        "description" : "By June 2018, engage 170 individuals (including Indigenous members) towards NRM awareness and skills relating to Ramsar and World Heritage areas, EPBC species and communities as measured by engagement evaluations (Strategic Objective 3)\n"
                    },
                    {
                        "assets" : [
                            "Natural/Cultural assets managed",
                            "Threatened Species",
                            "Threatened Ecological Communities",
                            "World Heritage area",
                            "Community awareness/participation in NRM",
                            "Remnant Vegetation"
                        ],
                        "description" : "By 2018, implement actions towards 30 Ha of improved habitat in 1 inland Ramsar site and World Heritage areas, and implement recovery actions for 10 EPBC listed flora species or communities as measured by partner evaluations and Natural Values Atlas data entry. (Strategic objective 4)"
                    }
                ]}},
        "budget" : {"headers" : [],
            "columnTotal" : [],
            "rows" : [
                {
                    "shortLabel" : "Farmers and fishers are increasing their long term returns through better management of the natural resource base",
                    "description" : "Community grants",
                    "rowTotal" : 212500,
                    "costs" : [
                        {
                            "dollar" : "25000"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "0"
                        }
                    ]
                }]}},
    associatedProgram : "National Landcare Programme",
    associatedSubProgram : "Regional Funding",
    planStatus: "approved"
});
createProject({name:'project 6', projectId:"project_6", programId:'program_1',managementUnitId:"mu_1", grantId:"RLP-Test-Program-Project-1",
    outputTargets:[
        {"outputLabel":"Pest Management Details",
            "target":"600",
            "scoreLabel":"Area covered (Ha) by pest treatment actions",
            "scoreName":"totalAreaTreatedHa",
            "unit":"Ha",
            "scoreId":"score_4"
        }
    ],
    custom:{"details":{"objectives" : {
                "rows1" : [
                    {
                        "assets" : [
                            "Natural/Cultural assets managed",
                            "Threatened Species",
                            "Threatened Ecological Communities",
                            "World Heritage area",
                            "Community awareness/participation in NRM",
                            "Remnant Vegetation"
                        ],
                        "description" : "By June 2018, engage 170 individuals (including Indigenous members) towards NRM awareness and skills relating to Ramsar and World Heritage areas, EPBC species and communities as measured by engagement evaluations (Strategic Objective 3)\n"
                    },
                    {
                        "assets" : [
                            "Natural/Cultural assets managed",
                            "Threatened Species",
                            "Threatened Ecological Communities",
                            "World Heritage area",
                            "Community awareness/participation in NRM",
                            "Remnant Vegetation"
                        ],
                        "description" : "By 2018, implement actions towards 30 Ha of improved habitat in 1 inland Ramsar site and World Heritage areas, and implement recovery actions for 10 EPBC listed flora species or communities as measured by partner evaluations and Natural Values Atlas data entry. (Strategic objective 4)"
                    }
                ]}},
        "budget" : {"headers" : [],
            "columnTotal" : [],
            "rows" : [
                {
                    "shortLabel" : "Farmers and fishers are increasing their long term returns through better management of the natural resource base",
                    "description" : "Community grants",
                    "rowTotal" : 212500,
                    "costs" : [
                        {
                            "dollar" : "25000"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "62500"
                        },
                        {
                            "dollar" : "0"
                        }
                    ]
                }]}},
    associatedProgram : "National Landcare Programme",
    associatedSubProgram : "Regional Funding",
    planStatus: "approved"
});



createProgram({name:'National Landcare Programme', programId:'program_1' });
createProgram({name:'Regional Land Partnerships', programId:'program_2' });
createProgram({name:'Regional Land Partnerships', programId:'program_3' });

createMu({name:'test mu', managementUnitId:"mu_1"});
createMu({name:'test mu', managementUnitId:"mu_2"});
createMu({name:'test mu', managementUnitId:"mu_3"});

db.userPermission.insert({entityType:'au.org.ala.ecodata.Program', entityId:'program_1', userId:'1', accessLevel:'admin'});
db.userPermission.insert({entityType:'au.org.ala.ecodata.Project', entityId:'project_1', userId:'1', accessLevel:'admin'});
db.userPermission.insert({entityType:'au.org.ala.ecodata.ManagementUnit', entityId:'mu_1', userId:'1', accessLevel:'admin'});

db.userPermission.insert({entityType:'au.org.ala.ecodata.Program', entityId:'program_2', userId:'1', accessLevel:'admin'});
db.userPermission.insert({entityType:'au.org.ala.ecodata.Project', entityId:'project_2', userId:'1', accessLevel:'admin'});
db.userPermission.insert({entityType:'au.org.ala.ecodata.ManagementUnit', entityId:'mu_2', userId:'1', accessLevel:'admin'});

db.userPermission.insert({entityType:'au.org.ala.ecodata.Program', entityId:'program_3', userId:'1', accessLevel:'admin'});
db.userPermission.insert({entityType:'au.org.ala.ecodata.Project', entityId:'project_3', userId:'1', accessLevel:'admin'});
db.userPermission.insert({entityType:'au.org.ala.ecodata.ManagementUnit', entityId:'mu_3', userId:'1', accessLevel:'admin'});

createScoreWeedHaDefaults({_id:35, scoreId: "score_1"});
// createScoreWeedHaDefaults({_id:36, scoreId: "score_2"});
// createScoreWeedHaDefaults({_id:37, scoreId: "score_3"});

createActivities({activityId:"activity_1", projectId:"project_1", type : "Managed for invasive weeds"});
createActivities({activityId:"activity_2", projectId:"project_2", type : "Managed for invasive weeds"});
createActivities({activityId:"activity_3", projectId:"project_3", type : "Managed for invasive weeds"});

createOutput({activityId:"activity_1", outputId:"output_1", data:{"linearAreaTreated":"1","areaTreatedHa":"10",
        "treatmentEventType":"Initial treatment"}});
createOutput({activityId:"activity_2", outputId:"output_2", data:{"linearAreaTreated":"1","areaTreatedHa":"10",
        "treatmentEventType":"Initial treatment"}})
createOutput({activityId:"activity_3", outputId:"output_3", data:{"linearAreaTreated":"1","areaTreatedHa":"10",
        "treatmentEventType":"Initial treatment"}});







//  // for Invasive Species Management - Pests & Diseases

createScoreInvasiveSpecies({_id: 39, scoreId:"score_4"});
// createScoreInvasiveSpecies({_id: 40, scoreId:"score_5"});
// createScoreInvasiveSpecies({_id: 41, scoreId:"score_6"});

createActivities({activityId:"activity_4", progress:"finished",projectId: "project_4", type:"Pest Management"});
createActivities({activityId:"activity_5", progress:"finished", projectId: "project_5", type:"Pest Management"});
createActivities({activityId:"activity_6", progress:"finished",projectId: "project_6", type:"Pest Management"});

createPestOutDataDefaults({activityId:"activity_4", outputId:"output_4"});
createPestOutDataDefaults({activityId:"activity_5", outputId:"output_5"});
createPestOutDataDefaults({activityId:"activity_6", outputId:"output_6"});

loadActivityForms();
