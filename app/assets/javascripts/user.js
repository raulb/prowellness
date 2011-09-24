jQuery(document).ready(function($) {
  
  // page onloaded, go to input register
  $.scrollTo('#register_band',400); 
  $('#register_data form input[type="text"]:first').focus();
  
  $('#ok').click(function(event) {
    event.preventDefault();
    
    $.scrollTo('#register_data',400); 
    $('#register_data form input[type="text"]:first').focus();
  });
});
