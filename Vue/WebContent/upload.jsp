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
<title>Data Loads</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	//Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
	  var fileName = $(this).val().split("\\").pop();
	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});

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
	  <h1>Data Loads</h1>
	  <hr>
	</div>
	<%
		String successMessage = (String) request.getAttribute("successMessage");
		String errorMessage = (String) request.getAttribute("errorMessage");
	%>
	<%
		if (successMessage != null && !successMessage.trim().equals("")) {
	%>
	<div class="alert alert-success alert-dismissible" id="success">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <%=successMessage%>
	</div>
	<% }%>
	<%
		if (errorMessage != null && !errorMessage.trim().equals("")) {
	%>
	<div class="alert alert-danger alert-dismissible" id="failure">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <%=errorMessage%>
	</div>
	<% }%>
	<div class="panel-body">
	    <h3>Import Scenarios</h3>
	    <br>
	    <form method="post" action="UploadServlet" enctype="multipart/form-data">
	    <div class="custom-file col-md-6 col-lg-3">
	      <input type="file" class="custom-file-input" id="customFile" name="filename" required="required">
	      <label class="custom-file-label" for="customFile">Choose file</label>
	      <br><br>
	      <a href="./Scenarios.xlsx" style="margin-left: -12px;">Download Sample File</a>
	    </div>
	    <div class="mt-3">
	      <button type="submit" class="btn btn-primary purpule">Submit</button>
	    </div>
    </form>
	</div>
	<br clear="all">
</div>
</body>
</html>