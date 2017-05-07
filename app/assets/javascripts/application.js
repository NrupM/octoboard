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
//= require_tree .

$( document ).on('turbolinks:load', function() {
  console.log("It works on each visit!")
  // // Initialize collapse button
  $(".button-collapse").sideNav();
  // // Initialize collapsible (uncomment the line below if you use the dropdown variation)
  // $('.collapsible').collapsible();

  $('select').material_select();
  $('#textarea1').val('New Text');
  $('#textarea1').trigger('autoresize');

  $('.datepicker').pickadate({
   selectMonths: true, // Creates a dropdown to control month
   selectYears: 15 // Creates a dropdown of 15 years to control year
 });

})

function showSweetAlertConfirmModal(e) {
  swal({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: 'green',
    cancelButtonColor: 'red',
    confirmButtonText: 'Yes, delete it!'
  }).then(function () {
    swal(
      'Deleted!',
      'Your file has been deleted.',
      'success'
    )
  })
}
