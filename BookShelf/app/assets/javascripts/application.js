// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require select2-full
//= require bootstrap-sprockets
//= require bootstrap-datetimepicker
//= require turbolinks
//= require_tree .
//= require moment 
//= require fullcalendar
//= require jquery-fileupload
//= require select2-full

$(function() {
    $('form').each(function() {
        $(this).find('input').keypress(function(e) {
            // Enter pressed?
            if ($(this).val().length != 0) {
            	if((e.which == 10 || e.which == 13)) {
	                this.form.submit();
	            }
            }
        });
    });
});

function showLoginForm(){
  document.getElementById("loginForm").style.display = "block";
}

function hideLoginForm(){
  document.getElementById("loginForm").style.display = "none";
}
