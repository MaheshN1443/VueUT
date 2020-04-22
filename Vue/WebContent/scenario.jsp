<%@page import="com.dto.TestScenario"%>
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
<title>Test Scenarios</title>
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

</script>


<!-- <p>Vue App</p>
<a href="./MyServlet">Please click here</a>
<img src="D:\VUE-RGB_Color_Dark.png" class="img-rounded" alt="Cinque Terre">
 -->
<%
	List<TestScenario> testScenario = (List<TestScenario>) session.getAttribute("testScenarioList");
%>
<div class="panel panel-primary" style="margin:20px;">
	<a href="javascript:history.back()" style="padding-left: 1232px !important;"><button type="button" class="btn btn-info">Back</button></a>
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin:24px 0;">
	  <a class="navbar-brand" href="#">Test Scenarios</a>
	  <h4><font color="white"><a style="padding-left: 340px;">Hi <%=(String)session.getAttribute("guestName")%> <i class="fa fa-user" style="font-size:24px"></i></a></font></h4>
	  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navb">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	      </li>
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	    <iframe src="http://free.timeanddate.com/clock/i78ye57b/n505/fn6/pct/ftbi/bo2/ts1/ta1" frameborder="0" width="124" height="21" allowTransparency="true"></iframe>&nbsp;&nbsp;
	      <a href="./index.jsp"><button class="btn btn-success my-2 my-sm-0" type="button">Home</button></a>&nbsp;
	      <a href="./addScenario.jsp"><button class="btn btn-success my-2 my-sm-0" type="button">Add Scenario</button></a>
	    </form>
	  </div>
	</nav>
	<br>
	<div class="alert alert-success alert-dismissible" id="success" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<div class="alert alert-danger alert-dismissible" id="failure" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<table id="example" class="table table-condensed">
		<thead>
			<tr>
			<th width="10%">Module</th>
			<th width="5%">Sub Module</th>
			<th width="5%">Scenario Code</th>
			<th width="20%">Scenario Name</th>
			<!-- <th width="20%">Description</th> -->
			<th width="10%">Is Active?</th>
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
				<a href="./editScenario?testScenarioID=<%=ts.getTestScenarioID()%>"><button type="button" class="btn btn-info" >Edit</button></a>
				<button type="button" class="btn btn-danger" onclick="deleteScenario(<%=ts.getTestScenarioID()%>);">Delete</button>
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