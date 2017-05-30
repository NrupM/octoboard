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

  //progressBar script
  if (document.getElementById("myBar")) {
    var elem = document.getElementById("myBar");
    var width = 1;
    var id = setInterval(frame, 8);
    function frame() {
      if (width >= 100) {
        clearInterval(id);
      } else {
        width++;
        elem.style.width = width + '%';
      }
    }
  }

  $('.button-collapse').sideNav();
  $('select').material_select();
  $('.collapsible').collapsible();
  $('.materialize-textarea').val(' ');
  $('.materialize-textarea').trigger('autoresize');


  //datepicker for applications and interviews (allow past entries)
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 15
  });

  //datepicker for future goals
  $('.datepickerGoals').pickadate({
    selectMonths: true,
    selectYears: 15,
    min: true
  });

  //allow use to edit password
  $('#change-password').click(function(e) {
    e.preventDefault();
    $("input[type='password']").attr('disabled', false);
  });

});
