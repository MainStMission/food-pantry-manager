$('#print-order').click(function() { 
  $.ajax({
    type: post,
    url: household_path,
    data: household,
    success: function() {
      $('#myModal').show();
    }
  })
});
