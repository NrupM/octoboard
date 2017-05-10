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
  $(".button-collapse").sideNav();
  $('select').material_select();
  $('.collapsible').collapsible();
  $('#textarea1').val('New Text');
  $('#textarea1').trigger('autoresize');
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 15
  });
  $('.datepickerGoals').pickadate({
    selectMonths: true,
    selectYears: 15,
    min: true
  });
  $('#change-password').click(function(e) {
    e.preventDefault();
    $("input[type='password']").attr('disabled', false);
  });
});
