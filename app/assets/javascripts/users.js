function ready() {

   // auto-focus the task_name input box on every page load
   // $('#task_name').focus();

   // submit the edit_task form when the "primary" button is clicked
   $('.modal-footer .btn-primary').click(function() {
     $('#new_user').submit();
   });
 }

 // Rails/Turbolinks ready function
 //   works on Turbolinks/AJAX page loads
 $(document).on('turbolinks:load', ready);
