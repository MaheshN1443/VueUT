<%@page import="com.dto.TestCaseParam"%>
<%@page import="com.dto.TestCase"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<style>
.mywidth {
  width: 800px !important;
  margin: auto;
  left: -125px !important;
}
</style>
<body>
<%
List<TestCase> testCases = (List<TestCase>)request.getAttribute("testCases");

%>
<script type="text/javascript">
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
  

function saveOverrideParams() {
	var arry = $.find('[id^="paramId"]');
	var arryCheck = $.find('[id^="checkId"]');
	var arryLength = arry.length;
	var obj = {};
	for (var i=0; i<arryLength; i++) {
		var id = $(arry[i]).attr('id');
		var checkId = $(arryCheck[i]).attr('id');
		var value = $('#'+id).val();
		var checkVal = 0;
		if (document.getElementById(checkId).checked) {
			checkVal = 1;
		}
		obj[id+'-'+checkVal] = value;
	}
	var mappingIdParam = $('#mappingIdParam').val();

  	var actionUrl = 'saveOverrideParams?mappingId='+mappingIdParam;
	$.ajax({
		url : actionUrl,
		type : 'POST',
		async : false,
		data  : {
			'jsonData' : JSON.stringify(obj)
		}, 
		success : function(response) {
			//console.log("response >>>"+response);
			//alert('Data saved Successfully !!!');
			$('#myModalEdit').modal('toggle');
			sessionStorage.reloadAfterPageLoad = response;
			location.reload();
		}
	});
	
}
</script>
<%
	List<TestCaseParam> testCaseParams = (List<TestCaseParam>) request.getAttribute("testCaseParams");
%>
    <div class="modal-dialog" id="test">
    <input type="hidden" id="mappingIdParam" value="<%=(String)request.getAttribute("mappingId")%>">
      <!-- Modal content-->
      <div class="modal-content mywidth">
        <div class="modal-header" style="background: black;">
          <h5 class="modal-title"><font color="white">Override Parameters</font></h5>
          <button type="button" class="close" data-dismiss="modal"><font color="white">&times;</font></button>
        </div>
        <div class="panel-body">
        <div class="table-responsive">
        <table id="classTable" class="table table-bordered">
          <thead class="thead-light">
          	<tr>
          		<th width="20%">Parameter</th>
          		<th width="30%">Default Value</th>
          		<th width="40%">Override Value</th>
          		<th width="10%">Expr?</th>
          	</tr>
          </thead>
          <tbody>
          	<%
			for (TestCaseParam dto: testCaseParams) {
				String paramValue = dto.getParamValue();
				boolean isXml = (paramValue != null && paramValue.contains("<Root>")) ? true : false;
			%>
            <tr>
              <td><%=dto.getParamName()%></td>
              <%
              	if (isXml) {
              	%>
              	<td>
              		<textarea rows="5" cols="60" disabled="disabled"><%=paramValue%></textarea>
              	</td>
              	<% } else { %>
              	<td><%=paramValue%></td>
              	<% } %>
              
              <td><input type="text" id="paramId<%=dto.getTestCaseParamID()%>" class="form-control" value="<%=dto.getOverrideValue()%>"></td>
              <td><input type="checkbox" id="checkId<%=dto.getTestCaseParamID()%>"></td>
            </tr>
            <%
			}
            %>
          </tbody>
        </table>
        </div>
        <br>
		<%-- <div class="col-md-12 col-sm-12">
		<%
		for (TestCaseParam dto: testCaseParams) {
		%>
		 
		<div class="row">
			<div class="form-group col-md-4 col-sm-8">
				<lable><%=dto.getParamName()%></lable>
  			</div>
  			<div class="form-group col-md-4 col-sm-8">
  				<input type="text" id="paramId<%=dto.getTestCaseParamID()%>" class="form-control" value="<%=dto.getParamValue()%>">
  			</div>
  			<div class="form-group col-md-4 col-sm-8">
  			Expression <input type="checkbox" id="checkId<%=dto.getTestCaseParamID()%>">
  			</div>
		</div>
		<%
		}
		%>
		</div> --%>
		</div>
        <div class="modal-footer">
		<button type="button" class="btn btn-primary" onclick="saveOverrideParams();">Save</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
</body>
</html>