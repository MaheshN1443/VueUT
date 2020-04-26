<%@page import="com.util.Util"%>
<%@page import="com.dto.TestScenario"%>
<%@page import="com.dto.TestCase"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!--   	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/rowreorder/1.2.6/js/dataTables.rowReorder.min.js"></script>
	  <script src="http://harvesthq.github.io/chosen/chosen.jquery.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>Scenarios</title>
</head>
<body>
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
				$('#success').delay(2000).fadeOut('slow');
			} else {
				$('#failure').css('display','').html(message);
				$('#failure').delay(2000).fadeOut('slow');
			}
			
		}	
	} catch (e) {
		console.log("Error >>"+e);
	}
	
    $('#example').DataTable({
    	//rowReorder: true
    });
});

function deleteScenario(scenarioId) {  //Elimina la fila actual
    var result = confirm("Do you want to delete?");
    if (result) {
        $.ajax({
    		url : 'deleteTestScenario?scenarioId='+scenarioId,
    		type : 'POST',
    		async : false,
    		success : function(response) {
    			sessionStorage.reloadAfterPageLoad = response;
    			location.reload();
    		}
    	});
    }
}

function callModalPopup(scenarioId) {

	var arryCheck = $.find('[id^="checkId"]');
	var arryLength = arryCheck.length;
	var obj = {};
	var count = 0;
	var idName = "";
	
	for (var i = 0; i < arryLength; i++) {
		var checkId = $(arryCheck[i]).attr('id');
		var checkVal = 0;
		if (document.getElementById(checkId).checked) {
			checkVal = 1;
			obj[checkId] = true;
			idName = checkId.split("checkId")[1];
			count++;
		}
	}
	
	if (count == 0) {
		alert('Please select one scenario.');
		return false;
	} else if (count > 1) {
		alert('Scenario selection should not be more than one.');
		return false;		
	}
	
	$('#modalScenarioId').val(idName);
	$('#myModal').modal('toggle');
	
/* 	var actionUrl = 'changeOrder?scenarioId='+scenarioId+'&wayFrom=popup';
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
	}); */
}

function saveDupScenario() {
	
	var modalScenarioId = $('#modalScenarioId').val();
	var scenarioName = $('#scenarioName').val();
	var scenarioCode = $('#scenarioCode').val();
	var description = $('#description').val();
	
	if (scenarioName == undefined || scenarioName == null || scenarioName == '') {
		alert('Scenario Name is required.');
		return false;
	}
	
	if (description == undefined || description == null || description == '') {
		alert('Description is required.');
		return false;		
	}
	
	var actionUrl = 'dupScenario?modalScenarioId='+modalScenarioId;
	$.ajax({
		url : actionUrl,
		type : 'POST',
		async : false,
		data : {
			'scenarioName' : scenarioName,
			'description' : description
			,'scenarioCode' : scenarioCode
		},
		success : function(response) {
			//console.log("response >>>"+response);
			//alert('Data saved Successfully !!!');
			$('#myModal').modal('toggle');
			sessionStorage.reloadAfterPageLoad = response;
			location.reload();
		}
	});
}

function execute() {
	
	var arryCheck = $.find('[id^="checkId"]');
	var arryLength = arryCheck.length;
	var obj = {};
	var count = 0;
	
	for (var i = 0; i < arryLength; i++) {
		var checkId = $(arryCheck[i]).attr('id');
		var checkVal = 0;
		if (document.getElementById(checkId).checked) {
			checkVal = 1;
			obj[checkId] = true;
			count++;
		}
	}
	
	if (count == 0) {
		alert('Please select atleast one scenario.');
		return false;
	}
	
	
	var actionUrl = 'executeScenarios';
	$.ajax({
		url : actionUrl,
		type : 'POST',
		async : false,
		data  : {
			'jsonData' : JSON.stringify(obj)
		}, 
		success : function(response) {
			//console.log("response >>>"+response);
			//alert('Job submitted Successfully !!!');
			sessionStorage.reloadAfterPageLoad = response;
			location.reload();
		}
	});
}
</script>
<!-- <p>Vue App</p>
<a href="./MyServlet">Please click here</a>
<img src="D:\VUE-RGB_Color_Dark.png" class="img-rounded" alt="Cinque Terre">
 -->
<%
	List<TestScenario> testScenario = (List<TestScenario>) session.getAttribute("testScenarioList");
%>
<div class="panel panel-primary" style="margin:20px;">
  	<jsp:include page="navInclude.jsp"/>
	<div class="alert alert-success alert-dismissible" id="success" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<div class="alert alert-danger alert-dismissible" id="failure" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<div class="page-header">
	  <h1>Scenarios 
	  <span style="margin-left: 940px;">
	  <button type="button" class="btn btn-primary purpule" onclick="callModalPopup();" id ="myBtn">Duplicate</button>
	  <button type="button" class="btn btn-primary purpule" onclick="execute();">Execute</button>
	  </span>
	  </h1>
	  <hr>
	</div>
	<table id="example" class="table table-condensed">
		<thead>
			<tr>
			<th width="5%"></th>
			<th width="10%">Module</th>
			<th width="5%">Sub Module</th>
			<th width="5%">Scenario Code</th>
			<th width="20%">Scenario Name</th>
			<!-- <th width="20%">Description</th> -->
			<th width="5%">Active?</th>
			<th width="10%">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (testScenario != null) {
				for(TestScenario ts: testScenario) {
					boolean status = ts.isActive();
				%>
				<tr>
				<td><input type="checkbox" class="form-control" style="width: 19px !important;" id="checkId<%=ts.getTestScenarioID()%>"></td>
				<td><%=ts.getModuleName() %></td>
				<td><%=ts.getSubModuleName() %></td>
				<td><%=ts.getScenarioCode()%></td>
				<td><%=ts.getScenarioName()%></td>
				<%-- <td><%=ts.getDescription()%></td> --%>
				<td>
					<% if (status) { %>
					<input type="checkbox" checked="checked" disabled="disabled">
					<%} else { %>
						<input type="checkbox" disabled="disabled">
					<%} %>
				</td>
				<td>
				<a class="purpule" href="./editScenario?testScenarioID=<%=ts.getTestScenarioID()%>"><i class="fa fa-edit" style="font-size:24px"></i></a>&nbsp;
				<a class="red" onclick="deleteScenario(<%=ts.getTestScenarioID()%>);"><i class="fa fa-trash" style="font-size:24px"></i></a>&nbsp;
				<% String whereQuery = "ScenarioId="+ts.getTestScenarioID();%>
				<a href="<%=Util.getReportUrl(whereQuery, "Scenario Results", "PDF")%>" title="Download as PDF"><img src="https://img.icons8.com/color/23/000000/pdf.png" style="vertical-align: -4px;"/></a>
				</tr>
				<%
				}
			} else {
			%>
			<tr colspan="6">
				<td>No records to display.</td>
			</tr>
			<%}%>
		</tbody>
	</table>
	<!-- Modal -->
	<br clear="all">
	<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
	    <input type="hidden" id="modalScenarioId">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: black;">
          <h5 class="modal-title"><font color="white">Duplicate Scenario</font></h5>
          <button type="button" class="close" data-dismiss="modal"><font color="white">&times;</font></button>
        </div>
        <div class="panel-body">
	
		<div class="col-md-12 col-sm-12">
			<div class="row">
				<div class="form-group col-md-12 col-sm-12">
				<label for="name">Scenario Name</label>
	            <input type="text" class="form-control input-sm" name="scenarioName" id="scenarioName" value="">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12 col-sm-12">
				<label for="name">Scenario Code</label>
	            <input type="text" class="form-control input-sm" name="scenarioCode" id="scenarioCode" value="">
				</div>
			</div>

		    <div class="row">
	        <div class="form-group col-md-12 col-sm-12">
	            <label for="name" >Description</label>
	            <textarea class="form-control input-lg" rows="4" cols="125" name="description" id="description"></textarea>	            
	        </div>
	        </div>
		</div>
		</div>
        <div class="modal-footer">
		<button type="button" class="btn btn-primary" onclick="saveDupScenario();">Save</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
	</div>
</div>
</body>
</html>