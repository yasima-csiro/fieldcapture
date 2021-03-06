<h4>Additional benefits</h4>
<table class="table secondary-outcome">

    <thead>

    <tr class="header">
        <th class="outcome-priority">Secondary outcome(s)</th>
        <th class="priority">Secondary Investment Priorities <fc:iconHelp container="body">Other investment priorities that will benefit from the project.  Delete the row if there are no secondary outcomes.</fc:iconHelp></th>
        <th class="remove"></th>
    </tr>
    </thead>
    <tbody data-bind="foreach:details.outcomes.secondaryOutcomes">
    <tr>
        <td class="outcome-priority"><select data-validation-engine="validate[required]"
                                             data-bind="value:description, options: details.outcomes.selectableSecondaryOutcomes, optionsCaption: 'Please select', disable: $parent.isProjectDetailsLocked()"></select>
        </td>
        <td class="priority">
            <select data-bind="value:asset, options: details.outcomes.outcomePriorities(description()), optionsCaption: 'Please select', select2:{}, disable: $parent.isProjectDetailsLocked()" class="input-large asset"></select>
        </td>
        <td class="remove">
            <span data-bind="if:!$parent.isProjectDetailsLocked()">
                <i class="fa fa-remove" data-bind="click: $parent.removeSecondaryOutcome"></i>
            </span>
        </td>
    </tr>

    </tbody>
    <tfoot>
    <tr>
        <td colspan="3">
            <button type="button" class="btn btn-small"
                    data-bind="disable: details.outcomes.secondaryOutcomes().length >= 5 || isProjectDetailsLocked(), click: addSecondaryOutcome">
                <i class="fa fa-plus"></i> Add a row</button></td>
    </tr>
    </tfoot>
</table>