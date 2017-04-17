// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load',function(){
	$('.alert-success').fadeOut(2500);

	$('body').on('click', '.bookmark-link',function(){
		event.preventDefault();
		var url = $(this).data("url");
		window.open(url);
	});

	$('body').on('click', '.result-link', function(){
		event.preventDefault();
		var list = $(this).next();
		if($(list).is(":visible")){
			$(list).slideUp();
		}else{
			$(list).slideDown();
		}
	});
});