//= require jquery-1.6.2.min
//= require jquery-ui-1.8.16.custom.min
//= require jquery.tmpl.min
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require jquery.fileupload-ui
//= require jquery_ujs

/* WYSIWYG */
//= require wysihtml5/advanced
//= require wysihtml5/wysihtml5-0.2.0

jQuery(document).ready(function(){

  $('#post_body').keyup(function(e){
    $('#preview').html($(this).val());
    e.preventDefault(); e.stopPropagation();
  });

  $('#fileupload').fileupload({
    url: "/attachments.json",
    type: "POST",
    limitConcurrentUploads: 1,
    autoUpload: true,
    add: function (e, data) {
        var that = $(this).data('fileupload');
        that._adjustMaxNumberOfFiles(-data.files.length);
        data.isAdjusted = true;
        data.isValidated = that._validate(data.files);
        data.context = that._renderUpload(data.files)
            .prependTo($(this).find('.files')).fadeIn(function () {
                // Fix for IE7 and lower:
                $(this).show();
            }).data('data', data);
        if ((that.options.autoUpload || data.autoUpload) &&
                data.isValidated) {
            data.jqXHR = data.submit();
        }
    }
  });

  $('.attachment').live('focus', function(){
    window.setTimeout(function(){
        $(this).select();
    },100);
  });

});
