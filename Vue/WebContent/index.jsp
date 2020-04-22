<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="Login_v1/image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v1/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v1/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login_v1/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v1/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v1/css/util.css">
	<link rel="stylesheet" type="text/css" href="Login_v1/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<%
		String guestName = (String) session.getAttribute("guestName");
		guestName = (guestName == null || guestName.trim().equals("")) ? "Guest" : guestName;
	%>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100" style="height: 580px !important;">

				<div class="login100-pic js-tilt" data-tilt>
					<!-- <img src="Login_v1/images/img-01.png" alt="IMG"> -->
					<img src="images/Vue001.jpg" alt="IMG">
				</div>
				
				
				<form class="login100-form validate-form" id="myForm">
					<span class="login100-form-title">
						Hi <%=guestName%> <i class="fa fa-user" aria-hidden="true"></i>
					</span>

					<!-- <div class="wrap-input100 validate-input" data-validate = "Guest is required">
						<input class="input100" type="text" name="guestName" placeholder="Guest">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div> -->
		
					<!-- <div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div> -->
					
					<!-- <div class="container-login100-form-btn">
						<a href="./testScenario">
						<button class="login100-form-btn">
							Scenario
						</button>
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="submitFun(testCase);">
							Test Case
						</button>
					</div> -->
					
					<a href="./testScenario"><button type="button" class="login100-form-btn">Scenario</button></a><br><br>
					<a href="./testCase"><button type="button" class="login100-form-btn">Test Case</button></a>
	
					<!-- <div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div> -->

					<div class="text-center p-t-136" style="margin-top: -86px !important;">
						<a class="txt2" href="./">
							Exit your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">
function submitFun(actionUrl) {
	document.getElementById("myForm").action = "./"+actionUrl;
	document.getElementById("myForm").submit();
}
</script>
	
<!--===============================================================================================-->	
	<script src="Login_v1/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v1/vendor/bootstrap/js/popper.js"></script>
	<script src="Login_v1/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v1/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v1/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="Login_v1/js/main.js"></script>

</body>
</html>