"use strict";
 $(".delete_item").on('click', function(e){
    e.preventDefault();
    var action_url = $(this).attr('href');
    var CSRF_TOKEN = $("input[name=csrf_test_name]").val();

    swal({
         title: "Are you sure?",
         text: "You will not be able to recover this module!",
         type: "warning",
         confirmButtonText: "Yes, delete it!",
        confirmButtonColor: '#3085d6',
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        cancelButtonText: "No, cancel plx!",
        cancelButtonColor: '#d33'
     },
    function (isConfirm) {
      if (isConfirm) {
          window.location.href = action_url;
      }
     else{
         swal("Cancelled", "Your module file is safe :)", "success");
     }
     
     return false;
    });
 });
 
