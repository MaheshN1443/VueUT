function bConfirm(message, handler){
  $(`<div class="modal fade" id="myModal" role="dialog"> 
     <div class="modal-dialog"> 
       <!-- Modal content--> 
        <div class="modal-content"> 
           <div class="modal-body" style="padding:10px;"> 
             <h4 class="text-center">${message}</h4> 
             <div class="text-center"> 
               <a class="btn btn-danger btn-yes">yes</a> 
               <a class="btn btn-default btn-no">no</a> 
             </div> 
           </div> 
       </div> 
    </div> 
  </div>`).appendTo('body');
 
  //Trigger the modal
  $("#myModal").modal({
     backdrop: 'static',
     keyboard: false
  });
  
   //Pass true to a callback function
   $(".btn-yes").click(function () {
       handler(true);
       $("#myModal").modal("hide");
   });
    
   //Pass false to callback function
   $(".btn-no").click(function () {
       handler(false);
       $("#myModal").modal("hide");
   });

   //Remove the modal once it is closed.
   $("#myModal").on('hidden.bs.modal', function () {
      $("#myModal").remove();
   });
}