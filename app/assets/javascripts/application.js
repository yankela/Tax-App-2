// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery/dist/jquery.min
//= require_tree .
//= require bootstrap/dist/js/bootstrap.min
//= require algolia/v3/algoliasearch.min





$(document).scroll(function() {
  var y = $(this).scrollTop();
  if (y >= 550) {
    $('.fa-plus-circle').fadeIn();
  } else {
    $('.fa-plus-circle').fadeOut();
  }
});


  //
  //
  // $(".newexpensebutton").click(function() {
  //   $("#createbutton").click(function(){
  //       $("#edit_expense_category_title").submit();
  //   });
  // });


createcategory = function () {
      $("#createbutton").click(function(){
          $("#edit_expense_category").submit();
      });

}





$(document).on("turbolinks:load", createcategory);
