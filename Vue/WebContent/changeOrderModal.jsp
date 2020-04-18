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
  
  function saveOrder() {
	  var arr = [];
	  $("#tcFromPopup > option").each(function(){
	     arr.push(this.value);
	  });
	  var order = arr.toString();
	  var groupIdParam = $('#groupIdParam').val();
	  var testScenarioId = $('#testScenarioID').val().toString();
	  console.log("order :"+order);
	  console.log("groupIdParam :"+groupIdParam);
	  console.log("testScenarioId :"+testScenarioId);

	  	var actionUrl = 'saveChangeOrder?testScenarioId='+testScenarioId+'&groupId='
	  				+groupIdParam+'&testCaseIds='+order;
		$.ajax({
			url : actionUrl,
			type : 'POST',
			async : false,
			success : function(response) {
				//console.log("response >>>"+response);
				//alert('Data saved Successfully !!!');
				$('#myModal').modal('toggle');
				sessionStorage.reloadAfterPageLoad = response;
				location.reload();
			}
		});
	} 


</script>
    <div class="modal-dialog">
    <input type="hidden" id="groupIdParam" value="<%=(String)request.getAttribute("groupIdParam")%>">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: black;">
          <h5 class="modal-title"><font color="white">Test Case Ordering</font></h5>
          <button type="button" class="close" data-dismiss="modal"><font color="white">&times;</font></button>
        </div>
        	<div class="panel-body">
	
		<div class="col-md-12 col-sm-12">
<div class="row">
				<div class="form-group col-md-8 col-sm-8">
				<lable>&nbsp;</lable>
  <select id="tcFromPopup" size="8" class="form-control" style="width: 300px;" multiple="">
                   <%
					for (TestCase tcObj: testCases) {		
		              %>
		              <option value="<%=tcObj.getTestCaseID()%>"><%=tcObj.getTestCaseName() %></option>
		              <%
              		} 
              %>
              </select>
    
  </div>
	<div class="form-group col-md-2 col-sm-4" style="padding-top: 26px !important;">
	<br>
	<br>
	
  <button class="btn btn-secondary btn-sm"  onclick="listboxMove('tcFromPopup', 'up');"><i class="fas fa-angle-up"></i></button><br><br>
  <button class="btn btn-secondary btn-sm"  onclick="listboxMove('tcFromPopup', 'down');"><i class="fas fa-angle-down"></i></button>
	</div>
</div>
  
</div>
</div>
        <div class="modal-footer">
		<button type="button" class="btn btn-primary" onclick="saveOrder();">Save</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
</body>
</html>