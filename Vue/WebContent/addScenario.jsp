<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/rowreorder/1.2.6/js/dataTables.rowReorder.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Add Scenario</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	var addStatus = $('#addStatus').val();
	if (addStatus != undefined && addStatus != null && addStatus != '' && addStatus != 'null') {
		$('#failure').css('display','').html("Failed to add Scenario.");
		$('#failure').delay(1000).fadeOut('slow');		
	}
});
</script>
<body>
<div class="panel panel-primary" style="margin:20px;">
	  	<jsp:include page="navInclude.jsp"/>
	<div class="alert alert-danger alert-dismissible" id="failure" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>	
	<div class="page-header">
	  <h1>Add Scenario</h1>
	  <hr>
	</div>
	<div class="panel-body">
	    <form id="addTestScenarioForm" action="./addTestScenario" method="post">
	    <input type="hidden" id="addStatus" value="<%=(String) request.getAttribute("addStatus")%>">
		<div class="col-md-12 col-sm-12">
			<div class="row">
			<div class="form-group col-md-4 col-sm-8">
	            <label for="name">Module </label>
	            <input type="text" class="form-control input-sm" name="moduleName" value="" required="required">
	        </div>
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Sub Module </label>
	            <input type="text" class="form-control input-sm" name="subModule" value="" required="required">
	        </div>
	        <div class="form-group col-md-4 col-sm-8" style="padding-top: 6px;">
	            <label for="name">Active 
	            <input type="checkbox" class="form-control input-sm" name="isActive">
	            </label>
	        </div>
	        </div>
	        <div class="row">
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Scenario</label>
	            <input type="text" class="form-control input-sm" name="scenarioName" value="" required="required">
	        </div>
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Scenario Code</label>
	            <input type="text" class="form-control input-sm" name="scenarioCode" value="" required="required">
	        </div>
	        </div>
	        <div class="row">
	        <div class="form-group col-md-8 col-sm-8">
	            <label for="name" >Description</label>
	            <textarea class="form-control input-lg" rows="4" cols="117" name="description"></textarea>	            
	        </div>
	        </div>	        
	        <div class="row">
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name"></label>
	            <!-- <input type="submit" class="form-control input-sm" name="Submit"> -->
	            <button type="submit" class="btn btn-primary btn-lg purpule">Add</button>
	        </div>
	        <div class="form-group col-md-4 col-sm-8">
	        </div>
	        </div>
		</div>
	</form>
	</div>
	<br clear="all">
</div>
</body>
</html>