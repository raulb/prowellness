jQuery(document).ready(function($) {
  $('.filters').hide();
  
  $('.toggle_filters').click(function(e){
    $('.filters').toggle();
    e.stopPropagation(); e.preventDefault();
  });

  var page = 1,
      loading = false;

  function nearBottomOfPage() {
    return $(window).scrollTop() > $('li:last').position().top - 300;
  }

  $(window).scroll(function(){
    if (loading) {
      return;
    }

    if(nearBottomOfPage()) {
      loading=true;
      page++;
      $.ajax({
        url: $('a[rel=pagination]').attr('href') + '&page=' + page,
        type: 'get',
        dataType: 'script',
        success: function() {
          $(window).sausage('draw');
          loading=false;
        }
      });
    }
  });

  $(window).sausage();
});
