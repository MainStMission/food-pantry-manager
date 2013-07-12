 $(document).ready(function() {                         
  $('#btnPrint').click(function() {
   window.print();
   $.ajax({
    type: get,
    url: '/households',
    data: your_data,
  })
   return false;
  });
 });