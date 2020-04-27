<%@page import="com.util.PropertiesUtil"%>
<%@page import="com.util.Util"%>
<%@page import="com.dao.TestCaseDao"%>
<%@page import="com.dto.TestCase"%>
<%@page import="com.dao.TestScenarioDao"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.TestScenario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/choosen_bootstrap.css" />

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/rowreorder/1.2.6/js/dataTables.rowReorder.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	<script src="http://harvesthq.github.io/chosen/chosen.jquery.js"></script> -->

	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="http://harvesthq.github.io/chosen/chosen.jquery.js"></script> 

<!--   	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/rowreorder/1.2.6/js/dataTables.rowReorder.min.js"></script>
	  <script src="http://harvesthq.github.io/chosen/chosen.jquery.js"></script>
	  
	  <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/choosen_bootstrap.css" />

<title>Reports</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	$('.chosen-select').chosen();
    $('.chosen-select-deselect').chosen({ allow_single_deselect: true });
    showTable();
	var addStatus = $('#addStatus').val();
	if (addStatus != undefined && addStatus != null && addStatus != '' && addStatus != 'null') {
		$('#failure').css('display','').html("Failed to add Scenario.");
		$('#failure').delay(1000).fadeOut('slow');		
	}
});
//If you want to change it dynamically
function toggleOn() {
  $('#toggle-trigger').bootstrapToggle('on')
}
function toggleOff() {
  $('#toggle-trigger').bootstrapToggle('off')  
}
//if you want get value
function getValue()
{
 var value=$('#toggle-trigger').bootstrapToggle().prop('checked');
 console.log(value);
}
function showTable() {
	var value = $('#toggle-trigger').bootstrapToggle().prop('checked');
	if (value == true) {
		$('#history').hide();
		$('#results').show();
	} else {
		$('#history').show();
		$('#results').hide();
	}
}
</script>
<body>
<%
TestScenarioDao scenario = new TestScenarioDao();
List<TestScenario> scenariosList = scenario.getScenarioList();

TestCaseDao tcase = new TestCaseDao();
List<TestCase> testCasesList = tcase.getTestCaseList();

String reportCommonUrl = PropertiesUtil.reportsServerUrl+"?/"+PropertiesUtil.reportsFolderPath;

%>
<div class="panel panel-primary" style="margin:20px;">
	  	<jsp:include page="navInclude.jsp"/>
	<div class="alert alert-danger alert-dismissible" id="failure" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>	
	<div class="page-header">
	  <h1>Reports</h1>
	  <hr>
	</div>
	<div class="panel-body">
	    <form id="addTestScenarioForm" action="./addTestScenario" method="post">
	  	<input id="toggle-trigger" type="checkbox" checked data-toggle="toggle" data-off="History Reports" data-on="Results Reports" data-onstyle="success" data-offstyle="warning" onchange="showTable();">
	  	<input type="hidden" id="reportCommonUrl" value="<%=reportCommonUrl%>">
	  	
	  	<br><br>
		<div class="col-md-8 col-sm-8">
			<div class="col-md-12 col-sm-12" id="results">
				<hr>
		        <div class="row">
				<div class="form-group col-md-4 col-sm-8">
	            <select id="testScenarioIds" data-placeholder="Choose Scenario" class="chosen-select" multiple tabindex="4">
	              <option value=""></option>
	              <%
	              for(TestScenario obj: scenariosList ){
	            	%>
	            	<option value="<%=obj.getTestScenarioID()%>"><%=obj.getScenarioName()%></option>
	            	<%  
	              }
	              %>
	            </select>
	            </div>
	            <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('pdf','scenario');" title="Download as PDF"><img src="https://img.icons8.com/color/30/000000/pdf.png"/></a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('EXCEL','scenario');" title="Download as EXCEL"><img src="https://img.icons8.com/color/33/000000/ms-excel.png"/></a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('CSV','scenario');" title="Download as CSV"><img src="https://img.icons8.com/dusk/30/000000/csv.png"/></a></label>
		         </div>
				</div>
				<hr>
				<div class="row">
				<div class="form-group col-md-4 col-sm-8">
	            <select id="testCaseIds" data-placeholder="Choose Test Cases" class="chosen-select" multiple tabindex="4">
	              <option value=""></option>
	              <%
	              for(TestCase obj: testCasesList ){
	            	%>
	            	<option value="<%=obj.getTestCaseID()%>"><%=obj.getTestCaseName()%></option>
	            	<%  
	              }
	              %>
	            </select>
	            </div>
	            <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('pdf','testCase');" title="Download as PDF"><img src="https://img.icons8.com/color/30/000000/pdf.png"/></a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('EXCEL','testCase');" title="Download as EXCEL"><img src="https://img.icons8.com/color/33/000000/ms-excel.png"/></a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('CSV','testCase');" title="Download as CSV"><img src="https://img.icons8.com/dusk/30/000000/csv.png"/></a></label>
		         </div>
				</div>
				<hr>
			</div>
			<div class="col-md-12 col-sm-12" id="history" style="display: none;">
				<hr>
		        <div class="row">
				<div class="form-group col-md-4 col-sm-8">
	           		<input type="text" class="form-control" readonly="readonly" value="Scenario History"/>
	            </div>
	            <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('pdf','scenarioHistory');" title="Download as PDF"><img src="https://img.icons8.com/color/30/000000/pdf.png"/></a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('EXCEL','scenarioHistory');" title="Download as EXCEL"><img src="https://img.icons8.com/color/33/000000/ms-excel.png"/></a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('CSV','scenarioHistory');" title="Download as CSV"><img src="https://img.icons8.com/dusk/30/000000/csv.png"/></a></label>
		         </div>
				</div>
				<hr>
				<div class="row">
				<div class="form-group col-md-4 col-sm-8">
	           		<input type="text" class="form-control" readonly="readonly" value="Test Case History"/>
	            </div>
	            <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('pdf','testCaseHistory');" title="Download as PDF"><img src="https://img.icons8.com/color/30/000000/pdf.png"/></a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('EXCEL','testCaseHistory');" title="Download as EXCEL"><img src="https://img.icons8.com/color/33/000000/ms-excel.png"/></a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a onclick="generateReport('CSV','testCaseHistory');" title="Download as CSV"><img src="https://img.icons8.com/dusk/30/000000/csv.png"/></a></label>
		         </div>
				</div>
				<hr>
			</div>
				
			<!-- <div class="table-responsive" id="history" style="display: none;">

			<table class="table">
				<tbody>
					<tr>
						<td>Scenario</td>
						<td><a href="#"><img src="https://img.icons8.com/color/30/000000/pdf.png"/></a></td>
						<td><a href="#"><img src="https://img.icons8.com/color/33/000000/ms-excel.png"/></a></td>
						<td><a href="#"><img src="https://img.icons8.com/dusk/30/000000/csv.png"/></a></td>
					</tr>
					<tr>
						<td>Test Case</td>
						<td><a href="#"><img src="https://img.icons8.com/color/30/000000/pdf.png"/></a></td>
						<td><a href="#"><img src="https://img.icons8.com/color/33/000000/ms-excel.png"/></a></td>
						<td><a href="#"><img src="https://img.icons8.com/dusk/30/000000/csv.png"/></a></td>
					</tr>
				</tbody>
			</table>
	        </div> -->
	      </div>
	</form>
	</div>
	<br clear="all">
</div>
<script type="text/javascript">
function generateReport(format,reportName) {
	
	var arrayData = [];
	var name = "";
	var appendString = "";
	var param = "";
	var reportCommonUrl = $('#reportCommonUrl').val();
	
	if (reportName != null && reportName == 'scenario') {
		
		arrayData = $("#testScenarioIds").val();
		name = "Scenario Results";
		appendString = "ScenarioId";
		
	} else if (reportName != null && reportName == 'scenarioHistory') {
		
		reportCommonUrl = reportCommonUrl+"/Scenario History&rs:Command=Render&rs:Format="+format;
		window.location.href = reportCommonUrl;
		return false;
		
	} else if (reportName != null && reportName == 'testCaseHistory') {
		
		reportCommonUrl = reportCommonUrl+"/Test Case History&rs:Command=Render&rs:Format="+format;
		window.location.href = reportCommonUrl;
		return false;
		
	} else {
		
		arrayData = $("#testCaseIds").val();
		name = "Test Case Results";
		appendString = "TestCaseId";
		
	}
	
	var arryLength = (arrayData != undefined && arrayData != null) ? arrayData.length : 0;
	
	if (arryLength == 0) {
		if (reportName != null && reportName == 'scenario') {
			alert('Select atleast one Scenario.');
		} else {
			alert('Select atleast one Test Case.');
		}
		return false;
	}
	
	for (var i = 0; i < arryLength; i++) {
		if (i == (arryLength - 1)){
			param += appendString+"="+arrayData[i];	
		} else {
			param += appendString+"="+arrayData[i]+"&";
		}
	}
	
	if (param != undefined && param != null && param != '') {
		reportCommonUrl = reportCommonUrl+"/"+name+"&rs:Command=Render&rs:Format="+format+"&"+param;
	} else {
		reportCommonUrl = reportCommonUrl+"/"+name+"&rs:Command=Render&rs:Format="+format;
	}
	window.location.href = reportCommonUrl;
}
</script>
</body>
</html>