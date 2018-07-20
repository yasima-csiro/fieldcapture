<!-- ko with:details.services -->
<h4>Project services and minimum targets</h4>

<table class="table budget-table">
    <thead>
    <tr>
        <th class="index" rowspan="2"></th>
        <th class="service required" rowspan="2">Service</th>
        <th class="score required" rowspan="2">Target measure</th>
        <th class="budget-cell required" rowspan="2">Total to be delivered<fc:iconHelp html="true">The overall total of Project Services specified in the Project Work Order to be delivered during the project delivery period. Note: this is not necessarily the sum of the minimum annual targets set out for the service.

            <b>Note: this is not necessarily the sum of the minimum annual targets set out for the service</b></fc:iconHelp></th>
        <th data-bind="attr:{colspan:periods.length+1}">Minimum annual targets <fc:iconHelp>Specify the minimum total target for each Project Service to be delivered each financial year. Note: the sum of these targets will not necessarily equal the total services to be delivered.</fc:iconHelp></th>
    </tr>
    <tr>

        <!-- ko foreach: periods -->
        <th class="budget-cell"><div data-bind="text:$data"></div></th>
        <!-- /ko -->
        <th class="remove"></th>
    </tr>
    </thead>
    <tbody data-bind="foreach : services">
    <tr>
        <td class="index"><span data-bind="text:$index()+1"></span></td>
        <td class="service">
            <select data-bind="options: selectableServices, optionsText:'name', optionsValue:'id', optionsCaption: 'Please select', value:serviceId, disable: $root.isProjectDetailsLocked()"
                    data-validation-engine="validate[required]"></select>
        </td>
        <td class="score">
            <select data-bind="options: selectableScores, optionsText:'label', optionsValue:'scoreId', optionsCaption: 'Please select', value:scoreId, disable: $root.isProjectDetailsLocked()"
                    data-validation-engine="validate[required]"></select>
        </td>
        <td class="budget-cell">
            <input id="minimumTargetsValid" type="text" data-bind="disable: $root.isProjectDetailsLocked(), value:minimumTargetsValid" data-validation-engine="validate[required]" data-errormessage="The sum of the minimum targets must be less than or equal to the overall target">

            <input type="number" data-bind="value: target, disable: $root.isProjectDetailsLocked()"
                   data-validation-engine="validate[min[0.01]]">
        </td>

        <!-- ko foreach: periodTargets -->
        <td class="budget-cell">
            <input type="number"
                   data-bind="value: target, disable: $root.isProjectDetailsLocked()"
                   data-validation-engine="validate[custom[number],min[0]]"/>
        </td>
        <!-- /ko -->


        <td class="remove">
            <span data-bind="if: $index() && !$root.isProjectDetailsLocked()"><i class="icon-remove"
                                                                                 data-bind="click: $parent.removeService"></i>
            </span>
        </td>
    </tr>
    </tbody>
    <tfoot>

    <tr>
        <td data-bind="attr:{colspan:periods.length+5}">
            <button type="button" class="btn btn-small"
                    data-bind="disable: $parent.isProjectDetailsLocked(), click: addService">
                <i class="icon-plus"></i> Add a row</button>
        </td>
    </tr>
    </tfoot>
</table>

<!-- /ko -->