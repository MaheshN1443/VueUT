<%@page import="java.util.stream.Collectors"%>
<%@page import="com.dto.TestCaseParam"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.TestCase"%>
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
			<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
	<script src="js_plugin/bootstable.js" ></script>
	<script src="js_plugin/confirm.js" ></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Edit Test Case</title>
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
    $('#makeEditable').DataTable({
    	 "lengthMenu": [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]],
    	rowReorder: true
    });
} ); 
/* $('#dtBasicExample-1').mdbEditor({
	rowEditor: true
	});
	$('.dataTables_length').addClass('bs-select'); */
    $(function() {

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

        for(i=0;i<each_data_value.length;i++)
        {
            if(each_data_value[i]>1)
            {
                console.log(each_data_value[i][2]);
                console.log(each_data_value[i].length);
            }

        }

});
    });
	$(document).ready(function() {
		removeTC();
	});
</script>
<%
	TestCase tc = (TestCase) request.getAttribute("testCase");
	List<TestCaseParam> tcp = tc.getParams();
%>
<div class="panel panel-primary" style="margin:20px;">
	<a href="javascript:history.back()" style="padding-left: 1232px !important;"><button type="button" class="btn btn-info">Back</button></a>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin:24px 0;">
	  <a class="navbar-brand" href="#">Test Cases Details</a>
	  <h4><font color="white"><a style="padding-left: 430px;">Hi <%=(String)session.getAttribute("guestName")%> <i class="fa fa-user" style="font-size:24px"></i></a></font></h4>
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
	            <input type="text" class="form-control input-sm" value="<%=tc.getModuleName()%>" disabled="disabled">
	        </div>
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Test Case </label>
	            <input type="text" class="form-control input-sm" value="<%=tc.getTestCaseName()%>" disabled="disabled">
	        </div>
	        </div>
	        <div class="row">
	        <div class="form-group col-md-4 col-sm-8">
	            <label for="name">Procedure Name</label>
	            <input type="text" class="form-control input-sm" value="<%=tc.getProcName()%>" disabled="disabled">
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
	        <input type="hidden" id="testCaseId" value="<%=tc.getTestCaseID()%>">
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
	<span style="float:right"><button id="but_add" class="btn btn-danger">Add Parameter</button></span>
        <!-- <button class="btn btn-primary" id="submit_data">Submit</button> -->
   <table class="table table-responsive-md table-sm table-bordered" id="makeEditable">
	<thead>
		<tr>
		<th width="5%">Seq.</th>
		<th width="20%">Parameter Name</th>
		<th width="40%">Parameter Value</th>
		<th width="8%">Direction</th>
		<th width="8%">Value Type</th>
		</tr>
	</thead>
		<tbody>
			<%
			if (tcp != null) {
				for(TestCaseParam params: tcp) {
					String pN = params.getParamName();
					String pt = params.getParamType();
					String ptVal = (pt != null && pt.trim().equalsIgnoreCase("O"))? "Output" : "Input";
					if (pN != null) {
				%>
				<tr>
				<td><%=params.getTestCaseParamID()%></td>
				<td><%=params.getParamName() %></td>
				<td> <%=params.getParamValue()%></td>
				<td> <%=ptVal %>
				</td>
				<td><%=params.getValueType()%></td>
				<%-- <td><a href="./editTestCaseParam?testCaseParamID=<%=params.getTestCaseParamID()%>"><button type="button" class="btn btn-info" >Edit</button></a></tr> --%>
				<%
					}
				}
			} else {
			%>
			<tr colspan="5">
				<td>No records to display.</td>
			</tr>
			<%}%>
		</tbody>
	</table>

	<br clear="all">
      </div>
	</div>
</div>
</body>
</html>