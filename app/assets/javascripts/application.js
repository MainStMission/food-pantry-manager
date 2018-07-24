
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.


 //= require jquery
 //= require jquery_ujs
 //= require bootstrap
 //= turbolinks
 //= require cocoon
 //= require jquery-ui
 //= require header
 //= require rails.validations
 //= require rails.validations.simple_form
 //= require jquery.timeago
 //= require bootstrap-datepicker
 //= require household
 //= require_tree .

$(function() {
  return $("#q_reset").click(function() {
    return $(".search-field").val('');
  });
});

$('.datepicker').datepicker({format: 'mm/dd/yyyy'});

$(document).ready(function() {
  	$('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
		var $total = navigation.find('li').length;
		var $current = index+1;
		var $percent = ($current/$total) * 100;
		$('#rootwizard').find('.bar').css({width:$percent+'%'});
	}});
});

$(function(){
	function check_to_hide_or_show_add_link() {
		if ($('#colours .nested-fields:visible').length == 5){
			$('colours .link a').hide();
		} else {
			$('#colours .link a').show();
		}
	}

	$('#colours').on('cocoon:after-insert', function(){
		check_to_hide_or_show_add_link();
	});

	$('colours').on('cocoon:after_remove', function(){
		check_to_hide_or_show_add_link();
	});

		check_to_hide_or_show_add_link();

});


