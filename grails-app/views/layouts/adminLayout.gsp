<g:applyLayout name="nrm">
    <head>
        <title><g:layoutTitle /></title>
        <style type="text/css">

        .icon-chevron-right {
            float: right;
            margin-top: 2px;
            margin-right: -6px;
            opacity: .25;
        }

        /* Pagination fix */
        .pagination .disabled, .pagination .currentStep, .pagination .step {
            float: left;
            padding: 0 14px;
            border-right: 1px solid;
            line-height: 34px;
            border-right-color: rgba(0, 0, 0, 0.15);
        }
        .pagination .prevLink {
            border-right: 1px solid #DDD !important;
            line-height: 34px;
            vertical-align: middle;
            padding: 0 14px;
            float: left;
        }

        .pagination .nextLink {
            vertical-align: middle;
            line-height: 34px;
            padding: 0 14px;
        }

        </style>
    </head>

    <body>
    <div class="container-fluid">

        <ul class="breadcrumb">
            <li>
                <g:link controller="home">Home</g:link>
                <span class="divider">/</span>

            </li>
            <li class="active"><g:link class="discreet" action="index">Administration</g:link> <span class="divider">/</span></li>
            <li class="active"><g:pageProperty name="page.pageTitle"/></li>
        </ul>

        <div class="row-fluid">
            <div class="span3">
                <ul class="nav nav-list nav-stacked nav-tabs">
                    <fc:breadcrumbItem href="${createLink(controller: 'home', action:'advanced')}" title="Manage Projects, Sites & Activities"/>
                    <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'users')}" title="Users" />
                    <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'audit')}" title="Audit" />
                    <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'staticPages')}" title="Static pages" />
                    <g:if test="${fc.userInRole(role: grailsApplication.config.security.cas.alaAdminRole)}">
                        <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'tools')}" title="Tools" />
                        <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'settings')}" title="Settings" />
                        <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'metadata')}" title="Raw activity model" />
                        <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'activityModel')}" title="Activity model" />
                        <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'rawOutputModels')}" title="Raw output models" />
                        <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'outputModels')}" title="Output models" />
                        <fc:breadcrumbItem href="${createLink(controller: 'admin', action: 'programsModel')}" title="Programs model" />
                    </g:if>
                </ul>
                <div style="text-align: center; margin-top: 30px;"><g:pageProperty name="page.adminButtonBar"/></div>
            </div>

            <div class="span9">
                <g:if test="${flash.errorMessage}">
                    <div class="container-fluid">
                        <div class="alert alert-error">
                            ${flash.errorMessage}
                        </div>
                    </div>
                </g:if>

                <g:if test="${flash.message}">
                    <div class="container-fluid">
                        <div class="alert alert-info">
                            ${flash.message}
                        </div>
                    </div>
                </g:if>

                <g:layoutBody/>

            </div>
        </div>
    </div>
    </body>
</g:applyLayout>