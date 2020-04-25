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
	  	<br><br>
		<div class="col-md-8 col-sm-8">
			<div class="col-md-12 col-sm-12" id="results">
		        <div class="row">
				<div class="form-group col-md-4 col-sm-8">
	            <select id="testCaseIds" data-placeholder="Choose Scenario" class="chosen-select" multiple tabindex="4">
	              <option value=""></option>
	            </select>
	            </div>
	            <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a href="#">PDF</a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a href="#">EXCEL</a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a href="#">CSV</a></label>
		         </div>
				</div>
				<div class="row">
				<div class="form-group col-md-4 col-sm-8">
	            <select id="testCaseIds" data-placeholder="Choose Test Cases" class="chosen-select" multiple tabindex="4">
	              <option value=""></option>
	            </select>
	            </div>
	            <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a href="#">PDF</a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a href="#">EXCEL</a></label>
		         </div>
		         <div class="form-group col-md-2 col-sm-4">
		            <label for="name"><a href="#">CSV</a></label>
		         </div>
				</div>
			</div>
			<div class="table-responsive" id="history" style="display: none;">

			<table class="table table-bordered">
				<tbody>
					<tr>
						<td>Scenario</td>
						<td><a href="#">PDF</a></td>
						<td><a href="#">EXCEL</a></td>
						<td><a href="#">CSV</a></td>
					</tr>
					<tr>
						<td>Test Case</td>
						<td><a href="#">PDF</a></td>
						<td><a href="#">EXCEL</a></td>
						<td><a href="#">CSV</a></td>
					</tr>
				</tbody>
			</table>
	        </div>
	      </div>
	</form>
	</div>
	<br clear="all">
</div>
</body>
</html>