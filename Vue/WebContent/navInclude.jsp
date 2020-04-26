<%@page import="com.util.Util"%>
<script type="text/javascript">
$(document).ready(function() {
	$('ul.navbar-nav li.dropdown').hover(function() {
		  $(this).find('.dropdown-menu').stop(true, true).delay(80).fadeIn(200);
	}, function() {
		  $(this).find('.dropdown-menu').stop(true, true).delay(80).fadeOut(200);
	});
});
</script>
<style>
.dropdown-item:focus {
    color: #f8f9fa;
    text-decoration: none;
    background-color: #563d7c;
}
a.red {
	color :	#dc3545 !important;
}
a.purpule {
	color :	#563d7c !important;
}
button.purpule {
	background : #563d7c !important;
}
</style>
<%
	String guestName = (String) session.getAttribute("guestName");
	guestName = (guestName == null || guestName.trim().equalsIgnoreCase("")) ? "Guest" : guestName;
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="margin:24px 0; background-color: #563d7c !important;">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="./index.jsp"><i class="fa fa-home" style="font-size:24px"></i><span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active dropdown">
           <a class="nav-link" href="./testScenario">
    	      Scenarios
	        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="./addScenario.jsp">Add Scenario</a>
          <a class="dropdown-item" href="#">Execution History</a>
        </div>
        
      </li>
      <li class="nav-item active dropdown">
            <a class="nav-link" href="./testCase">
    	      Test Cases
	        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="./addTestCase.jsp">Add Test Case</a>
          <a class="dropdown-item" href="#">Execution History</a>
        </div>
        
      </li>
      <li class="nav-item dropdown">
         <a class="nav-link" href="./reports.jsp" id="navbarDropdown">
          Reports
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<%=Util.getReportUrl("", "Scenario History", "PDF") %>">Scenario History</a>
          <a class="dropdown-item" href="<%=Util.getReportUrl("", "Test Case History", "PDF") %>">Test Case History</a>
        </div>
        
      </li>
      <li class="nav-item dropdown">
            <a class="nav-link" href="#">
    	      Tools
	        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="./upload.jsp">Data Loads</a>
        </div>
        
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
    	<span><font color="white">Hi <%=guestName%> <i class="fa fa-user" style="font-size:24px"></i></font></span>&nbsp;&nbsp;
        <a href="javascript:history.back()"><button type="button" class="btn btn-outline-success my-2 my-sm-0" >Back</button></a>&nbsp;&nbsp;
        <a href="./" title="Logout"><i class="fa fa-sign-out" aria-hidden="true" style="font-size:26px; color: white;"></i></a>
    </form>
  </div>
</nav>