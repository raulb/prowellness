//= require custom-form-elements

$(document).ready(function($) {

  $('#user_data form input[type="text"]:first').focus();
  
  $('#ok').click(function(event) {
    event.preventDefault();

    $.scrollTo('#user_data', 400);
    $('#user_data form input[type="text"]:first').focus();
  });
  
  $('.file').children('input').change(function(ev){
      $(this).parent().children('p').removeClass('empty');
      var file_name = $(this).val().replace('C:\\fakepath\\', '');
      if (file_name.length > 22){
         $(this).parent().children('p').text(file_name.substring(0,22)+'...');
      }
      else
         $(this).parent().children('p').text(file_name);

   });
     
});
