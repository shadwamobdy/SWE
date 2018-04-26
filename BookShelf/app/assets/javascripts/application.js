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

window.onclick = function(e) {
    var logIn = document.getElementById('loginContent');
    var logInBtn = document.getElementById('logInBtn');
    if ((logIn != null) && (e.target != logIn) && (e.target.parentElement != logIn) && (e.target != logInBtn)) {
        document.getElementById('loginForm').style.display = "none";
    }
    var bookDetails = document.getElementById('viewBookContent');
    var viewBookBtn1 = document.getElementById('viewBookBtn1');
    var viewBookBtn2 = document.getElementById('viewBookBtn2');
    if ((bookDetails != null) && (e.target != bookDetails) && (e.target.parentElement != bookDetails) 
        && (e.target != viewBookBtn1) && (e.target != viewBookBtn2)) {
        document.getElementById('viewBook').style.display = "none";
    }
    var logOutDropdown = document.getElementById("logOutDropdown");
    var dropBtn = document.getElementById("dropBtn");
    if ((logOutDropdown != null) && (e.target != logOutDropdown) && (e.target.parentElement != logOutDropdown)
        && (e.target != dropBtn) && (e.target != dropBtn)) {
        document.getElementById('logOutDropdown').style.display = "none";
        document.getElementById("dropBtn").style.backgroundColor = "#0068CB";
        document.getElementById("dropBtn").style.color = "white";
    }
    var addBookContent = document.getElementById("addBookContent");
    var addBookBtn = document.getElementById("addBookBtn");
    if ((addBookContent != null) && (e.target != addBookContent) && (e.target.parentElement != addBookContent)
        && (e.target != addBookBtn) && (e.target != addBookBtn)) {
        document.getElementById('addBook').style.display = "none";
    }
}

function showLoginForm() {
    document.getElementById("loginForm").style.display = "block";
}

function hideLoginForm() {
  document.getElementById("loginForm").style.display = "none";
}

function showBook(id) {
    document.getElementById('book_' + id).style.display = "block";
}

function hideBook(id) {
    document.getElementById('book_' + id).style.display = "none";
}

function showAddBook() {
    document.getElementById("addBook").style.display = "block";
}

function hideAddBook() {
    document.getElementById("addBook").style.display = "none";
}

function toggleDropdown() {
    if($('#logOutDropdown:visible').length == 0) {
        document.getElementById("logOutDropdown").style.display = "block";
        document.getElementById("dropBtn").style.backgroundColor = "white";
        document.getElementById("dropBtn").style.color = "#0068CB";
        document.getElementById("dropBtn").style.borderRadius = "10px";
    } else {
        document.getElementById("logOutDropdown").style.display = "none";
        document.getElementById("dropBtn").style.backgroundColor = "#0068CB";
        document.getElementById("dropBtn").style.color = "white";
    }
}