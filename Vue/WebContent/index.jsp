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
<title>Vue-Home</title>
</head>
<style>
body, html {
  height: 100%;
}

* {
  box-sizing: border-box;
}

.bg-image {
  /* The image used */
  background-image: url("images/Vue.png");

  /* Add the blur effect */
  filter: blur(8px);
  -webkit-filter: blur(8px);

  /* Full height */
  height: 100%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/* Position text in the middle of the page/image */
.bg-text {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
  text-align: center;
}
</style>
<body>
<div class="bg-image"></div>
<div align="center" class="container bg-text">
	<div class="page-header">
    	<h1>Vue Home</h1>      
  	</div>
	<button type="button" onclick="openPopup('testScenario');" class="btn btn-primary">Scenario</button><br><br>
	<button type="button" onclick="openPopup('testCase');" class="btn btn-primary">Test Case</button>
</div>
<!--Modal: Login with Avatar Form-->
<div class="modal fade" id="modalLoginAvatar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">
    <!--Content-->
    <div class="modal-content">

      <!--Header-->
      <div class="modal-header">
        <img src="images/USER01.png" alt="avatar" class="rounded-circle img-responsive">
      </div>
      <!--Body-->
      <div class="modal-body text-center mb-1">

        <h5 class="mt-1 mb-2">Guest Login</h5>
		<form id="form123">
        <div class="md-form ml-0 mr-0">
          <input type="text" id="form29" class="form-control form-control-sm validate ml-0" autocomplete="name" autofocus>
        </div>

        <div class="text-center mt-4">
          <button class="btn btn-primary mt-1" onclick="subForm();">Login</button>
          <input type="hidden" name="actionName" id="actionName">
          <input type="hidden" name="guestName" id="guestName">
        </div>
        </form>
      </div>

    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: Login with Avatar Form-->
<script type="text/javascript">
function subForm() {
	var guestName = $('#form29').val();
	if (guestName == undefined || guestName == null || guestName == '') {
		alert('Guest Name is required');
		return false;
	}
	$("#form123 input[name=guestName]:hidden").val(guestName);
	var actionName = $('#actionName').val();
	var actionUrl = './'+actionName;
	document.getElementById("form123").action = actionUrl;
	document.getElementById("form123").submit();
}
function openPopup(actionName) {
	$('#actionName').val(actionName);
	$('#modalLoginAvatar').modal('toggle');
}
</script>
</body>
</html>