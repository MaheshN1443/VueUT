<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
	<link rel="stylesheet" href="css/choosen_bootstrap.css" />
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/rowreorder/1.2.6/js/dataTables.rowReorder.min.js"></script>
	<script src="http://harvesthq.github.io/chosen/chosen.jquery.js"></script>

	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
	<!-- <script src="js_plugin/bootstable.js" ></script> -->
	<script src="js_plugin/confirm.js" ></script>

<head>

  <script>
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
  </script>

</head>

<body>
<div class="panel panel-primary" style="margin:20px;">
	<div class="panel-body">
	
		<div class="col-md-12 col-sm-12">
<div class="row">
				<div class="form-group col-md-2 col-sm-4">
  <select id="lst" size="8" class="form-control" style="width: 200px;" multiple="">
        <option value="1">Merbin</option>
        <option value="2">Franklin</option>
        <option value="3">Jose</option>
        <option value="4">Geetha Geetha Geetha Geetha</option>
        <option value="5">Jino</option>
        <option value="6">Ganesh</option>
        <option value="7">Kumar</option>
        <option value="8">Reegan</option>
  <option value="9">Rajesh</option>
  </select>
  </div>
	<div class="form-group col-md-4 col-sm-4">
	<br>
	<br>
	
  <button class="btn btn-secondary btn-sm"  onclick="listboxMove('lst', 'up');"><i class="fas fa-angle-up"></i></button><br><br>
  <button class="btn btn-secondary btn-sm"  onclick="listboxMove('lst', 'down');"><i class="fas fa-angle-down"></i></button>
	</div>
</div>
  
</div>
</div><!--  -->
</div>
</body>

</html>
