jQuery(document).ready(function() {
  
  var indexActive = $('#index-books').children('.current').children('a').attr('rel');
  showBook(indexActive);

  $('.pay-on-delivery').click(function(e){
    if ($(this).attr('id') == 'training_book') MODAL.open('#send_training_book');
    else if ($(this).attr('id') == 'woman_book') MODAL.open('#send_woman_book');

    e.preventDefault(); e.stopPropagation();
  });
  
  
});


function showBook(index) {
 var el = $('#books').children('li');
 
 el.not(el.eq(index)).fadeOut('fast',function(){
   el.eq(index).fadeIn('slow');
   
   //  Activate index
   $('#index-books').children('li.current').removeClass('current');
   $('#index-books').children('li').eq(index).addClass('current');
   
   $('#main-book-option').children('.current').removeClass('current');
   $('#main-book-option').children('a').eq(index).addClass('current');
    
   // SHOWING EXTRA CONTENT
   if ($('#main-book-option').children('.current').hasClass('mujer')) $('#extra-mujer').show();
   else $('#extra-mujer').hide();     

 });

}