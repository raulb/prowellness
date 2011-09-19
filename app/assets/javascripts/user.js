jQuery(document).ready(function($) {
  
  
  $('#ok').click(function(event) {
    event.preventDefault();
    
    $.scrollTo('#register_data',400); 
    $('#register_data form input[type="text"]:first').focus();
  });
});
