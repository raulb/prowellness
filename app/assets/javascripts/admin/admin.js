//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.tmpl.min
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require jquery.fileupload-ui

jQuery(document).ready(function(){

  $('#post_body').keyup(function(e){
    $('#preview').html($(this).val());
    e.preventDefault(); e.stopPropagation();
  });


  $('#fileupload').fileupload({
    url: "/attachments.json",
    type: "POST",
    limitConcurrentUploads: 1,
    autoUpload: true
  });

  $('.attachment').live('focus', function(){
    window.setTimeout(function(){
        $(this).select();
    },100);
  });

});
