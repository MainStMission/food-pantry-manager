$('#submit-btn').click(function() { 
  $.ajax({
    type: post,
    url: '/household_end_point',
    data: household,
    success: function() {
      $('#myModal').show();
    }
  })
});

$(document).ready(function() {
$('#visit-btn').bind('cocoon:after-insert', function() {
    $('#visit-btn').hide();
  })};