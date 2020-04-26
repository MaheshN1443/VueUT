<%@page import="com.util.Util"%>
<%@page import="com.dto.TestCase"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<title>Test Cases</title>
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
				$('#success').delay(1000).fadeOut('slow');
			} else {
				$('#failure').css('display','').html(message);
				$('#failure').delay(1000).fadeOut('slow');
			}
			
		}	
	} catch (e) {
		console.log("Error >>"+e);
	}
    $('#example').DataTable({
    	rowReorder: true
    });
});
function deleteTestCase(testCaseId) {  //Elimina la fila actual
    var result = confirm("Do you want to delete?");
    if (result) {
        $.ajax({
    		url : 'deleteTestCase?testCaseId='+testCaseId,
    		type : 'POST',
    		async : false,
    		success : function(response) {
    			sessionStorage.reloadAfterPageLoad = response;
    			location.reload();
    		}
    	});
    }
}
</script>
<!-- <p>Vue App</p>
<a href="./MyServlet">Please click here</a>
<img src="D:\VUE-RGB_Color_Dark.png" class="img-rounded" alt="Cinque Terre">
 -->
<%
	List<TestCase> testCase = (List<TestCase>) session.getAttribute("testCaseList");
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
	  <h1>Test Cases</h1>
	  <hr>
	</div>
	<table id="example" class="table table-condensed">
		<thead>
			<tr>
			<th width="10%">Module Name</th>
			<th width="30%">Test Case Name</th>
			<th width="30%">Procedure Name</th>
			<th width="5%">Active</th>
			<th width="10">Entity Type</th>
			<th width="10%">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (testCase != null) {
				for(TestCase tc: testCase) {
					boolean status = tc.isActive();
				%>
				<tr>
				<td><%=tc.getModuleName() %></td>
				<td><%=tc.getTestCaseName() %></td>
				<td><%=tc.getProcName() %></td>
				<td>
					<% if (status) { %>
					<input type="checkbox" checked="checked" disabled="disabled">
					<%} else { %>
						<input type="checkbox" disabled="disabled">
					<%} %>
				</td>
				<td><%=tc.getEntityTypeID() %></td>
				<td>
				<a class="purpule" href="./editTestCase?testCaseID=<%=tc.getTestCaseID()%>"><i class="fa fa-edit" style="font-size:24px"></i></a>&nbsp;
				<a class="red" onclick="deleteTestCase(<%=tc.getTestCaseID()%>);"><i class="fa fa-trash" style="font-size:24px"></i></a>
				<% String whereQuery = "TestCaseId="+tc.getTestCaseID();%>
				<a href="<%=Util.getReportUrl(whereQuery, "Test Case Results", "PDF")%>" title="Download as PDF"><img src="https://img.icons8.com/color/23/000000/pdf.png" style="vertical-align: -4px;"/></a>
			
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
	<br clear="all">
</div>
</body>
</html>