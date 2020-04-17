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
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/rowreorder/1.2.6/js/dataTables.rowReorder.min.js"></script>
	<script src="http://harvesthq.github.io/chosen/chosen.jquery.js"></script>

	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
	<!-- <script src="js_plugin/bootstable.js" ></script> -->
	<script src="js_plugin/confirm.js" ></script>
<title>Edit Scenario</title>
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
        },
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
	var testCaseIds = $('#testCaseIds').val().toString();
	var groupId = $('#groupId').val();
	if (testCaseIds == undefined || testCaseIds == null || testCaseIds == '') {
		alert('Please map atleast one Test Case.');
		return false;
	}
	if (groupId == undefined || groupId == null || groupId == '') {
		alert('Please select Group Id.');
		return false;
	}
	var actionUrl = 'mapTestCase?testCaseIds='+testCaseIds+'&groupId='+groupId;
	$.ajax({
		url : actionUrl,
		type : 'POST',
		async : false,
		success : function(response) {
			console.log("response >>>"+response);
			//alert('Data saved Successfully !!!');
			sessionStorage.reloadAfterPageLoad = response;
			location.reload();
		}
	});
}
function listboxMove(listID, direction) {
    var listbox = document.getElementById(listID);
    var selIndex = listbox.selectedIndex;
    if (-1 == selIndex) {
      alert("Please select an option to move.");
      return;
    }
    var increment = -1;
    if (direction == 'up')
      increment = -1;
    else
      increment = 1;
    if ((selIndex + increment) < 0 ||
      (selIndex + increment) > (listbox.options.length - 1)) {
      return;
    }
    var selValue = listbox.options[selIndex].value;
    var selText = listbox.options[selIndex].text;
    listbox.options[selIndex].value = listbox.options[selIndex + increment].value
    listbox.options[selIndex].text = listbox.options[selIndex + increment].text
    listbox.options[selIndex + increment].value = selValue;
    listbox.options[selIndex + increment].text = selText;
    listbox.selectedIndex = selIndex + increment;
  }
  try {
	  var arr = [];
	  $("#lst > option").each(function(){
	     arr.push(this.value);
	  });
  } catch(e) {
	  
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
</script>
<%
	TestCaseDao caseDao = new TestCaseDao();
	TestScenario tc = (TestScenario) request.getAttribute("testScenario");
	List<TestScenarioMapping> tcp = tc.getMapping();
%>
<div class="panel panel-primary" style="margin:20px;">
	<a href="javascript:history.back()" style="padding-left: 1232px !important;"><button type="button" class="btn btn-info">Back</button></a>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin:24px 0;">
	  <a class="navbar-brand" href="#">Scenario Details</a>
	  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navb">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	      </li>
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	      <a href="./"><button class="btn btn-success my-2 my-sm-0" type="button">Home</button></a>&nbsp;
	      <!-- <button class="btn btn-success my-2 my-sm-0" type="button">Add Test Case Param</button> -->
	    </form>
	  </div>
	</nav>
	<div class="panel-body">
	    <form>
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
	        </div>
	        <div class="row">
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Scenario</label>
	            <input type="text" class="form-control input-sm" value="<%=tc.getScenarioName()%>" disabled="disabled">
	        </div>
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Active 
	            <%if(tc.isActive()) { %>
	            <input type="checkbox" class="form-control input-sm" checked="checked" disabled="disabled">
	            <%} else { %>
	            <input type="checkbox" class="form-control input-sm" disabled="disabled">
	            <%} %>
	            </label>
	        </div>
	        <input type="hidden" id="testScenarioID" value="<%=tc.getTestScenarioID()%>">
	        </div>
	        <div class="row">
	        	<div class="form-group col-md-4 col-sm-8">
	            <label for="name">Description</label>
	            <textarea rows="4" cols="117" disabled="disabled"><%=tc.getDescription()%></textarea>
	        </div>
	        </div>
	          
		</div>
	</form>
	<form class="">
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
	            <input type="button" onclick="mapTestCase();" class="form-control input-sm btn btn-info" value="Map Test Case" style="margin-top: 7px !important;" >
	            </div>
		</div>
		</div>
	</form>
	<div class="alert alert-success alert-dismissible" id="success" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<div class="alert alert-danger alert-dismissible" id="failure" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<div class="card-body">
        <!-- <button class="btn btn-primary" id="submit_data">Submit</button> -->
   <table class="table table-responsive-md table-sm table-bordered" id="makeEditable">
	<thead>
		<tr>
		<th width="10%">Group</th>
		<th width="5%">Seq.</th>
		<th width="20%">Test Case</th>
		<th width="20%">Override Params</th>
		<th width="20%">Override Param Values</th>
		<th width="10%">Execution Order</th>
		<th width="20%">Actions</th>
		</tr>
	</thead>
		<tbody>
			<%
			
			int testCaseID=0;
			if (tcp != null) {
				for(TestScenarioMapping mapping: tcp) {
					String overrideparam = mapping.getOverrideParamName();
					String overrideparamval = mapping.getOverrideParamVal();
		testCaseID = mapping.getTestCaseID();
		List<TestCase> tcList = caseDao.getTestCase(testCaseID);
		TestCase testCase1 = Util.getTCObjByMatchId(tcList, testCaseID);
		String tcName = (testCase1 != null) ? testCase1.getTestCaseName() : "";
	
			%>
				<tr>
				<td><%="Group-"+mapping.getOccuranceGroup()%>
				  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" style="margin-left: 1050px !important;">Change Order</button>
				</td>
				<td><%=mapping.getTestScenarioMappingID()%></td>
				<td><%=tcName%></td>
				<td> <%=mapping.getOverrideParamName()%></td>
				<td> <%="<xmp>"+mapping.getOverrideParamVal()+"</xmp>"%></td>
				<td><%=mapping.getExecutionOrder()%></td>
				<td>
					<a href="#"><button type="button" class="btn btn-info" >Edit</button></a>
					<a href="#"><button type="button" class="btn btn-danger" >Delete</button></a>
				</td>
				<%-- <td><a href="./editTestCaseParam?testCaseParamID=<%=params.getTestCaseParamID()%>"><button type="button" class="btn btn-info" >Edit</button></a></tr> --%>
				<%

				}
			} else {
			%>
			<tr colspan="5">
				<td>No records to display.</td>
			</tr>
			<%}%>		</tbody>
	</table>

	<br clear="all">
      </div>
	</div>
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Test Case Ordering</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        	<div class="panel-body">
	
		<div class="col-md-12 col-sm-12">
<div class="row">
				<div class="form-group col-md-8 col-sm-8">
				<lable>&nbsp;</lable>
  <select id="lst" size="8" class="form-control" style="width: 300px;" multiple="">
        <option value="1">Merbin</option>
        <option value="2">Franklin</option>
        <option value="3">Jose</option>
        <option value="4">Geetha Geetha Geetha Geetha</option>
        <option value="5">Jino</option>
        <option value="6">Ganesh</option>
        <option value="7">Kumar</option>
        <option value="8">Reegan</option>
  <option value="9">Rajesh</option>
  </select>
  </div>
	<div class="form-group col-md-2 col-sm-4" style="padding-top: 26px !important;">
	<br>
	<br>
	
  <button class="btn btn-secondary btn-sm"  onclick="listboxMove('lst', 'up');"><i class="fas fa-angle-up"></i></button><br><br>
  <button class="btn btn-secondary btn-sm"  onclick="listboxMove('lst', 'down');"><i class="fas fa-angle-down"></i></button>
	</div>
</div>
  
</div>
</div>
        <div class="modal-footer">
		<button type="button" class="btn btn-primary">Save</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
</body>
</html>