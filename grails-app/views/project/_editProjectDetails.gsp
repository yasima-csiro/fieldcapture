<div class="row-fluid">
    <div class="control-group">
        <div style="float: left;" class="controls">
           <b>From: </b><span data-bind="text: plannedStartDate.formattedDate"></span>  <b>To: </b> <span data-bind="text: plannedEndDate.formattedDate"></span>
        </div>
		<div style="float: right;" data-bind="visible: planStatus() == 'approved'">
        	<span class="badge badge-success" style="font-size: 13px;">This plan has been approved</span>
        	<span data-bind="if:detailsLastUpdated"> <br/>Last update date : <span data-bind="text:detailsLastUpdated.formattedDate"></span></span>
        </div>
        <div style="float: right;" data-bind="visible: planStatus() != 'approved' ">
        	<span class="badge badge-warning" style="font-size: 13px;">This plan is not yet approved</span>
        	<span data-bind="if:detailsLastUpdated"><br/>Last update date :  <span data-bind="text:detailsLastUpdated"></span></span>
        </div>
       
    </div>
</div>

<div class="row-fluid space-after">
	    <div class="required">
	        <div id="project-objectives" class="well well-small">
	 			<label><b>Project objectives / goals / assets</b></label> 	 
		        <p>Please enter the details of the goals and assets of the project:</p>	        
			    <table style="width: 100%;">
			        <thead>
			            <tr>
			            	<th></th>
			                <th>Short label <span style="color: red;"><b>*</b></span></th>
			                <th>Description</th>
			                <th></th>
			            </tr>
			        </thead>
			        <tbody data-bind="foreach : details['objectives']['rows']">
			                <tr>
			                	<td width="2%"> <span data-bind="text:$index()+1"></span></td>
			                    <td width="30%"> <input style="width: 97%;" type="text"  class="input-xlarge"  data-bind="value: shortLabel" data-validation-engine="validate[required]"> </td>
			                    <td width="64%"> <textarea style="width: 97%;" data-bind="value: description" rows="5" ></textarea> </td>
			                    <td width="4%">
                        			<span data-bind="if: $index()" id="remove-objectives" ><i class="icon-remove" data-bind="click: $parent.removeObjectives"></i></span>
			                    </td>
			                </tr>
			        </tbody>
	                <tfoot>
          				<tr>
          					<td></td>
          					<td colspan="0" style="text-align:left;">
                  			<button type="button" class="btn btn-small" id="add-objectives" data-bind="click: addObjectives">
                  			<i class="icon-plus"></i> Add a row</button>
                  			</td>
                  		</tr>
  					</tfoot>
			    </table>
	        </div>
	    </div>
</div>

<div class="row-fluid space-after">
	    <div class="required">
	        <div id="project-milestones" class="well well-small">
	 			<label><b>Milestones</b></label> 	 
		        <p>Please enter the details of progress of the project against scheduled milestones during this reporting period:</p>	        
			    <table style="width: 100%;">
			        <thead>
			            <tr>
			            	<th></th>
			                <th>Short label <span style="color: red;"><b>*</b></span></th>
			                <th>Description</th>
							<th>Due date <span style="color: red;"><b>*</b></span></th>	
							<th></th>			                
			            </tr>
			        </thead>
			        <tbody data-bind="foreach : details['milestones']['rows']">
			                <tr>
			                	<td width="2%">  <span data-bind="text:$index()+1"></span></td>
			                    <td width="20%"> <input style="width: 97%;" type="text"  class="input-xlarge"  data-bind="value: shortLabel" data-validation-engine="validate[required]"> </td>
			                    <td width="54%"> <textarea style="width: 97%;" class="input-xlarge" data-bind="value: description"  id="partnership" rows="5"></textarea></td>
			                    <td width="20%">
			                    	<div class="input-append">
			                    		<fc:datePicker style="width: 80%;" targetField="dueDate.date" name="dueDate" data-validation-engine="validate[required]" printable="${printView}" size="input-large"/>
			                    	</div>
			                    </td>	
			                    <td width="4%">
                        			<span data-bind="if: $index()" id="remove-milestones" ><i class="icon-remove" data-bind="click: $parent.removeMilestones"></i></span>
			                    </td>		                    
			                </tr>
					</tbody>
 					<tfoot>
             				<tr>
             					<td></td>
             					<td colspan="0" style="text-align:left;">
                     			<button type="button" class="btn btn-small" id="add-milestones" data-bind="click: addMilestones">
                     			<i class="icon-plus"></i> Add a row</button></td>
                     		</tr>
					</tfoot>
								        
			    </table>
	        </div>
	    </div>
</div>


<div class="row-fluid space-after">
	<div class="required">
	        <div id="national-priorities" class="well well-small">
	 			<label><b>National and regional priorities</b></label> 	 
		        <p>Explain how the project aligns with all applicable national and regional priorities, plans and strategies.</p>	        
			    <table style="width: 100%;">
			        <thead>
			            <tr>
			            	<th></th>
			                <th>Short label <span style="color: red;"><b>*</b></span></th>
			                <th>Description</th>
							<th></th>			                
			            </tr>
			        </thead>
			        <tbody data-bind="foreach : details['nationalAndRegionalPriorities']['rows']">
			                <tr>
			                	<td width="2%"> <span data-bind="text:$index()+1"></span></td>
			                    <td width="30%"> <input style="width: 97%;" type="text"  class="input-xlarge"  data-bind="value: shortLabel" data-validation-engine="validate[required]"> </td>
			                    <td width="64%"><textarea style="width: 97%;" class="input-xlarge" data-bind="value: description"  id="national" rows="5"></textarea></td>
			                    <td width="4%"> 
                        			<span data-bind="if: $index()" id="remove-national" ><i class="icon-remove" data-bind="click: $parent.removeNationalAndRegionalPriorities"></i></span>
			                    </td>		                    
			                </tr>
					 </tbody>
			       
 					<tfoot>
             				<tr>
             					<td></td>
             					<td colspan="0" style="text-align:left;">
                     			<button type="button" class="btn btn-small" id="add-national" data-bind="click: addNationalAndRegionalPriorities">
                     			<i class="icon-plus"></i> Add a row</button></td>
                     		</tr>
					</tfoot>
					 			        
			    </table>
	        </div>
	    </div>
</div>

<div class="row-fluid space-after">
	    <div class="span6 required">
	        <div id="monitor-approach" class="well well-small">
	 			<label><b>Monitoring approach</b></label> 	 
		        <p>Explain the approach that will be used to monitor the implementation progress and outcomes of the project, including methods, resources, timing, etc</p>	        
				<textarea style="width: 98%;" data-bind="value: details['monitoringApproach'].description" class="input-xlarge" id="monitoring-approach" rows="5"
					data-validation-engine="validate[required]"></textarea>
	        </div>
	    </div>
		
	    <div class="span6">
	        <div id="data-sharing" class="well well-small">
	 			<label><b>Data sharing protocols</b></label>
	 			<p>Explain how the project will ensure that data being collected complies with state and commonwealth data standards / requirements / protocols and how it will shared.</p>	        
				<textarea style="width: 98%;" data-bind="value:details['dataSharingProtocols'].description" class="input-xlarge" id="data-sharing-protocols" rows="5"></textarea>
	        </div>
	    </div>
</div>

<div class="row-fluid space-after">
		    <div class="span6 required">
		        <div id="project-implementation" class="well well-small">
		 			<label><b>Project implementation / delivery mechanism</b></label> 
		 			<p>Explain how the project will be implemented, including methods, approaches, collaborations, etc.</p>	        
					<textarea style="width: 98%;" data-bind="value:details['projectImplementation'].description" class="input-xlarge" id="implementation" rows="5" data-validation-engine="validate[required]"></textarea>
		        </div>
		    </div>
		    
		    <div class="span6">
	        <div id="project-partnership" class="well well-small">
	 			<label><b>Project partnerships</b></label> 
	 			<p>Provide details on all project partners and the nature and scope of their participation in the project.</p>	        
				<textarea style="width: 98%;" data-bind="value:details['projectPartnership'].description" class="input-xlarge" id="partnership" rows="5"></textarea>
	        </div>
		</div>
</div>

<div id="save-details-result-placeholder"></div>
<div class="row-fluid">
	<div class="form-actions">
            <button type="button" data-bind="click: saveProjectDetails" id="project-details-save" class="btn btn-primary">Save changes</button>
            <button type="button" id="details-cancel" class="btn">Cancel</button>
	</div>	
</div>
