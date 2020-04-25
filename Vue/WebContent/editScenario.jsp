<%@page import="com.util.Util"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.dto.*"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.*"%>
<%@page import="com.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
	<link rel="stylesheet" href="css/choosen_bootstrap.css" />
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	 <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  	<!-- <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/rowreorder/1.2.6/js/dataTables.rowReorder.min.js"></script>
	<script src="http://harvesthq.github.io/chosen/chosen.jquery.js"></script>
	<script src="js_plugin/confirm.js" ></script>

	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
		<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"> -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
	<!-- <script src="js_plugin/bootstable.js" ></script> -->
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Scenario Details</title>
</head>
<body>
<style>
tr.group,
tr.group:hover {
    background-color: #ddd !important;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$('.chosen-select').chosen();
    $('.chosen-select-deselect').chosen({ allow_single_deselect: true });
});

$(document).ready(function() {
	
    var groupColumn = 0;
    var table = $('#makeEditable').DataTable({
        "columnDefs": [
            { "visible": false, "targets": groupColumn }
        ],
        "order": [[ groupColumn, 'asc' ]],
        "displayLength": 25,
        "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="6">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
        }
        //rowReorder: true
    } );
 
    // Order by the grouping
    /* $('#makeEditable tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === groupColumn && currentOrder[1] === 'asc' ) {
            table.order( [ groupColumn, 'desc' ] ).draw();
        }
        else {
            table.order( [ groupColumn, 'asc' ] ).draw();
        }
    } ); */
} );

function mapTestCase() {
	var testCaseIds = ($('#testCaseIds').val() != undefined && $('#testCaseIds').val() != null) ? $('#testCaseIds').val().toString() : '';
	var testScenarioId = $('#testScenarioID').val().toString();
	var groupId = $('#groupId').val();
	if (testCaseIds == undefined || testCaseIds == null || testCaseIds == '') {
		alert('Please map atleast one Test Case.');
		return false;
	}
	if (groupId == undefined || groupId == null || groupId == '') {
		alert('Please select Group Id.');
		return false;
	}
	var actionUrl = 'saveTestCaseMapping?testCaseIds='+testCaseIds+'&groupId='+groupId+'&testScenarioId='+testScenarioId;
	$.ajax({
		url : actionUrl,
		type : 'POST',
		async : false,
		success : function(response) {
			//console.log("response >>>"+response);
			//alert('Data saved Successfully !!!');
			sessionStorage.reloadAfterPageLoad = response;
			$("#form1").val($('input[name="testScenarioID"]').val(testScenarioId));
			document.getElementById('form1').action = "./editScenario?testScenarioID="+testScenarioId;
			document.getElementById('form1').submit();
		}
	});
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	try {
		var prvMessage = sessionStorage.reloadAfterPageLoad;
		if (prvMessage != undefined && prvMessage != null && prvMessage != '') {
			var strArray = prvMessage.split("@");
			var status = strArray[0];
			var message = strArray[1];
			sessionStorage.reloadAfterPageLoad = '';
			
			if (status == 'success') {
				$('#success').css('display','').html(message);
				$('#success').delay(1000).fadeOut('slow');
			} else {
				$('#failure').css('display','').html(message);
				$('#failure').delay(1000).fadeOut('slow');
			}
			
		}	
	} catch (e) {
		console.log("Error >>"+e);
	}
    /* $('#makeEditable').DataTable({
    	 "lengthMenu": [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]],
    	rowReorder: true
    }); */
} ); 
/* $('#dtBasicExample-1').mdbEditor({
	rowEditor: true
	});
	$('.dataTables_length').addClass('bs-select'); */
    /* $(function() {

        $('#makeEditable').SetEditable({ $addButton: $('#but_add')});

        $('#submit_data').on('click',function() {
        var td = TableToCSV('makeEditable', ',');
        console.log(td);
        var ar_lines = td.split("\n");
        var each_data_value = [];
        for(i=0;i<ar_lines.length;i++)
        {
            each_data_value[i] = ar_lines[i].split(",");
        }

     .   for(i=0;i<each_data_value.length;i++)
        {
            if(each_data_value[i]>1)
            {
                console.log(each_data_value[i][2]);
                console.log(each_data_value[i].length);
            }

        }

});
    }); */
	$(document).ready(function() {
		//removeTC();
	});
    function callModalPopup(groupId) {
    	var testScenarioId = $('#testScenarioID').val().toString();
    	var actionUrl = 'changeOrder?testScenarioId='+testScenarioId+'&groupId='+groupId;
    	$.ajax({
    		url : actionUrl,
    		type : 'POST',
    		async : false,
    		success : function(response) {
    			//console.log("response >>>"+response);
    			//alert('Data saved Successfully !!!');
    			$('#myModal').html(response);
    			$('#myModal').modal('toggle');
    		}
    	});
    }
    
    function deleteMapping(mappingId) {  //Elimina la fila actual
        var result = confirm("Do you want to delete?");
        if (result) {
            $.ajax({
        		url : 'deleteMapping?mappingId='+mappingId,
        		type : 'POST',
        		async : false,
        		success : function(response) {
        			sessionStorage.reloadAfterPageLoad = response;
        			location.reload();
        		}
        	});
        }
    }
    
    function callModalEditPopup(mappingId) {
    	var actionUrl = 'editOverrideParam?mappingId='+mappingId;
    	$.ajax({
    		url : actionUrl,
    		type : 'POST',
    		async : false,
    		success : function(response) {
    			//console.log("response >>>"+response);
    			//alert('Data saved Successfully !!!');
    			$('#myModalEdit').html(response);
    			$('#myModalEdit').modal('toggle');
    		}
    	});
    }
</script>
<%
	TestCaseDao caseDao = new TestCaseDao();
	TestScenario tc = (TestScenario) request.getAttribute("testScenario");
	List<TestScenarioMapping> tcp = tc.getMapping();
%>
<div class="panel panel-primary" style="margin:20px;">
	<jsp:include page="navInclude.jsp"/>
	<div class="page-header">
	  <h1>Scenario Details</h1>
	  <hr>
	</div>
	<div class="panel-body">
	    <form id="form1">
		<div class="col-md-12 col-sm-12">
			<div class="row">
			<div class="form-group col-md-4 col-sm-8">
	            <label for="name">Module </label>
	            <input type="text" class="form-control input-sm" title="<%=tc.getModuleName()%>" value="<%=tc.getModuleName()%>" disabled="disabled">
	        </div>
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Sub Module</label>
	            <input type="text" class="form-control input-sm" value="<%=tc.getSubModuleName()%>" disabled="disabled">
	        </div>
	        <div class="form-group col-md-2 col-sm-4" style="padding-top: 7px;">
	        <label for="name">Active 
	            <%if(tc.isActive()) { %>
	            <input type="checkbox" class="form-control input-sm" checked="checked" disabled="disabled">
	            <%} else { %>
	            <input type="checkbox" class="form-control input-sm" disabled="disabled">
	            <%} %>
	            </label>
	            </div>
	        </div>
	        <div class="row">
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Scenario</label>
	            <input type="text" class="form-control input-sm" value="<%=tc.getScenarioName()%>" disabled="disabled">
	        </div>
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Scenario Code</label>
	            <input type="text" class="form-control input-sm" value="<%=tc.getScenarioCode()%>" disabled="disabled">
	        </div>
	        <%-- <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Active 
	            <%if(tc.isActive()) { %>
	            <input type="checkbox" class="form-control input-sm" checked="checked" disabled="disabled">
	            <%} else { %>
	            <input type="checkbox" class="form-control input-sm" disabled="disabled">
	            <%} %>
	            </label>
	        </div> --%>
	        <input type="hidden" name="testScenarioID" id="testScenarioID" value="<%=tc.getTestScenarioID()%>">
	        </div>
	        <div class="row">
	        	<div class="form-group col-md-4 col-sm-8">
	            <label for="name">Description</label>
	            <textarea rows="4" cols="117" disabled="disabled"><%=tc.getDescription()%></textarea>
	        </div>
	        </div>
	          
		</div>
	</form>
	<form class="" id="form2">
		<div class="page-header">
			<h4>Map Test Cases</h4>    
	  	</div>
		<div class="border border-dark col-md-12 col-sm-12">
		<div class="row">
		  <div class="form-group col-md-4 col-sm-8">
			<label for="name">Test Cases</label>
            <select id="testCaseIds" data-placeholder="Choose a Test Case" class="chosen-select" multiple tabindex="4">
              <option value=""></option>
              <%
	      		List<TestCase> dropdownTestCases = caseDao.getTestCase(0);
					for (TestCase tcObj: dropdownTestCases) {		
              %>
              <option value="<%=tcObj.getTestCaseID()%>"><%=tcObj.getTestCaseName() %></option>
              <%
              	} 
              %>
              </select>
           </div>
           			<div class="form-group col-md-2 col-sm-4">
	            <label for="name">Group Id</label>
	            <input type="number" class="form-control input-sm" name="groupId" id="groupId" max="100" min="1">
	            </div>
           <div class="form-group col-md-2 col-sm-4">
	            <label for="name"></label>
	            <input type="button" onclick="mapTestCase();" class="form-control input-sm btn btn-info purpule" value="Map Test Case" style="margin-top: 7px !important;background : #563d7c !important;" >
	            <!-- <button onclick="mapTestCase();" class="form-control input-sm btn btn-info purpule" style="margin-top: 7px !important;" >Map Test Case</button> -->
	            </div>
		</div>
		</div>
	</form>
	<br>
	<div class="alert alert-success alert-dismissible" id="success" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<div class="alert alert-danger alert-dismissible" id="failure" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<div class="card-body table-responsive">
        <!-- <button class="btn btn-primary" id="submit_data">Submit</button> -->
   <table class="table table-responsive-md table-sm table-bordered" id="makeEditable">
	<thead  class="table table-bordered">
		<tr>
		<th width="10%">Group</th>
		<th width="5%">Seq.</th>
		<th width="20%">Test Case</th>
		<th width="25%">Override Params</th>
		<th width="30%">Override Param Values</th>
		<th width="10%">Execution Order</th>
		<th width="5%">Actions</th>
		</tr>
	</thead>
		<tbody>
			<%
			
			int testCaseID=0;
			int size = (tcp != null && !tcp.isEmpty()) ? tcp.size() : 0;
			boolean status = true;
			if (size == 1) {
				int scId = tcp.get(0).getTestScenarioMappingID();
				if (scId == 0) {
					status = false;
				}
			}
			
			if (tcp != null && status) {
				for(TestScenarioMapping mapping: tcp) {
					String overrideparam = mapping.getOverrideParamName();
					String overrideparamval = mapping.getOverrideParamVal();
		testCaseID = mapping.getTestCaseID();
		List<TestCase> tcList = caseDao.getTestCase(testCaseID);
		TestCase testCase1 = Util.getTCObjByMatchId(tcList, testCaseID);
		String tcName = (testCase1 != null) ? testCase1.getTestCaseName() : "";
		String paramValue = mapping.getOverrideParamVal();
		boolean isXml = (paramValue != null && paramValue.contains("<Root>")) ? true : false;
			%>
				<tr>
				<td><%="Group-"+mapping.getOccuranceGroup()%>
				  <button type="button" class="btn btn-success" onclick="callModalPopup(<%=mapping.getOccuranceGroup()%>);" style="margin-left: 1050px !important;">Change Order</button>
				</td>
				<td><%=mapping.getTestScenarioMappingID()%></td>
				<td><%=tcName%></td>
				<td> <%=mapping.getOverrideParamName()%></td>
				<%
              	if (isXml) {
              	%>
              	<td>
              		<textarea rows="5" cols="60" disabled="disabled"><%=paramValue%></textarea>
              	</td>
              	<% } else { %>
              	<td><%=paramValue%></td>
              	<% } %>
				<td><%=mapping.getExecutionOrder()%></td>
				<td>
					<a class="purpule" onclick="callModalEditPopup(<%=mapping.getTestScenarioMappingID()%>);"><i class="fa fa-edit" style="font-size:24px"></i></a>&nbsp;
					<a class="red" onclick="deleteMapping(<%=mapping.getTestScenarioMappingID()%>);"><i class="fa fa-trash" style="font-size:24px"></i></a>
				</td>
				<%-- <td><a href="./editTestCaseParam?testCaseParamID=<%=params.getTestCaseParamID()%>"><button type="button" class="btn btn-info" >Edit</button></a></tr> --%>
				<%
				}
			} else {
			%>
	<!-- 		<tr >
				<td colspan="7">No records to display.</td>
			</tr> -->
			<%}%>		</tbody>
	</table>

	<br clear="all">
      </div>
	</div>
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"></div>
  <div class="modal fade" id="myModalEdit" role="dialog"></div>
  
</div>
</body>
</html>