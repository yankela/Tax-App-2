function ready() {
  console.log('im ready')

  // auto-focus the task_name input box on every page load
  // $('#task_name').focus();
  $(".spinner").hide();
  // submit the edit_task form when the "primary" button is clicked
  $("#updatebutton").click(function() {
    $('#edit_receipt').submit();

  });
  $("#receipt-submit").click(function(){
    $(".spinner").show();
  });
}

$(document).on('turbolinks:load', ready);
