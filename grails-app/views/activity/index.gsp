<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${activity?.activityId}| ${site.name} | ${site.projectName} | Field Capture</title>
    <r:require module="knockout"/>
</head>
<body>
<ul class="breadcrumb">
    <li><g:link controller="home">Home</g:link> <span class="divider">/</span></li>
    <li><g:link controller="project" id="${site.projectId}">${site.projectName}</g:link> <span class="divider">/</span></li>
    <li><g:link controller="site" id="${site.siteId}">${site.name}</g:link> <span class="divider">/</span></li>
    <li class="active">${activity.type}
        <span data-bind="text:startDate.formattedDate"></span>/<span data-bind="text:endDate.formattedDate"></span>
    </li>
</ul>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="under-rule span12">
            <div class="clearfix">
                <h1 class="pull-left">${site.projectName}: ${site.name}</h1>
                <g:link action="edit" id="${activity.activityId}" class="btn pull-right title-edit">Edit activity</g:link>
            </div>

            <h2>Activity: ${activity.type}
                <span data-bind="text:startDate.formattedDate"></span>/<span data-bind="text:endDate.formattedDate"></span></h2>
            <p class="well well-small">${activity.description}</p>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <h3>Type</h3>
            <span class="span5">Type: ${activity.type}</span>
            <span class="span3">Starts: <span data-bind="text:startDate.formattedDate"></span></span>
            <span class="span3">Ends: <span data-bind="text:endDate.formattedDate"></span></span>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <h3 style="border-bottom: #eeeeee solid 1px;">Outputs</h3>
            <table class="table">
                <thead>
                <tr><td></td><td>Output id</td><td>Output Scores</td>
                    <td>Assessment date</td><td>Collector</td></tr>
                </thead>
                <tbody data-bind="foreach: outputs">
                <tr>
                    <td><a data-bind="attr: {href: '${createLink(controller: "output", action: "index")}' + '/' + outputId}"><i class="icon-eye-open" title="View"></i></a>
                        <a data-bind="attr: {href: '${createLink(controller: "output", action: "edit")}' + '/' + outputId}"><i class="icon-edit" title="Edit"></i></a>
                        <i data-bind="click: $root.deleteOutput" class="icon-trash" title="Delete"></i>
                    </td>
                    <td><a data-bind="text: outputId, attr: {href: '${createLink(controller: "output", action: "index")}' + '/' + outputId}"> </a></td>
                    <td>
                        <!-- ko foreach: scores -->
                        <span data-bind="text: name + ' = ' + score"></span><br>
                        <!-- /ko -->
                    </td>
                    <td data-bind="text: assessmentDate"></td>
                    <td data-bind="text: collector"></td>
                </tr>
                </tbody>
            </table>
            <button data-bind="click: newOutput" type="button" class="btn">Add an output</button>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <h3>Method</h3>
            <span class="span3">Census method: ${activity.censusMethod}</span>
            <span class="span3">Method accuracy: ${activity.methodAccuracy}</span>
            <span class="span3">Collector: ${activity.collector}</span>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <h3>Notes</h3>
            <span class="span6">Notes: ${activity.notes}</span>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12 metadata">
            <span class="span6">Created: <span data-bind="text:dateCreated.formattedDate"></span></span>
            <span class="span6">Last updated: <span data-bind="text:lastUpdated.formattedDate"></span></span>
        </div>
    </div>

    <hr />
    <div class="debug">
        <h3 id="debug">Debug</h3>
        <div style="display: none">
            <div>Outputs : ${activity.outputs}</div>
            <div>Activities : ${site.activities}</div>
            <div>Site : ${site}</div>
        </div>
    </div>
</div>
<r:script>
    var outputModel = ${activity.outputs};

    $(function(){
        function ViewModel () {
            var self = this;
            self.description = ko.observable("${activity.description}");
            self.notes = ko.observable("${activity.notes}");
            self.startDate = ko.observable("${activity.startDate}").extend({simpleDate: false});
            self.endDate = ko.observable("${activity.endDate}").extend({simpleDate: false});
            self.censusMethod = ko.observable("${activity.censusMethod}");
            self.methodAccuracy = ko.observable("${activity.methodAccuracy}");
            self.collector = ko.observable("${activity.collector}");
            self.fieldNotes = ko.observable("${activity.fieldNotes}");
            self.type = ko.observable("${activity.type}");
            self.siteId = ko.observable("${activity.siteId}");
            self.outputs = ko.observableArray(outputModel);
            self.dateCreated = ko.observable("${activity.dateCreated}").extend({simpleDate: true});
            self.lastUpdated = ko.observable("${activity.lastUpdated}").extend({simpleDate: true});
            self.notImplemented = function () {
                alert("Not implemented yet.")
            };
            self.enterData = function () {
                document.location.href = "${createLink(action: 'addData', id: activity.activityId)}"
            }
        }
        var viewModel = new ViewModel();
        ko.applyBindings(viewModel);
    });

</r:script>
</body>
</html>