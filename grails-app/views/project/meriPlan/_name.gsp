<h4 class="header-with-help">Project name</h4><fc:iconHelp>The project name will be visible on project overview page in MERIT</fc:iconHelp>
<g:if test="${explanation}">
    ${explanation}
</g:if>
<div class="project-name row-fluid">
    <input class="span12" type="text" data-validation-engine="validate[required,maxSize[${maxSize?:150}]]" data-bind="value:details.name, disable: isProjectDetailsLocked()" placeholder="${placeholder?:""}"></input>
</div>
