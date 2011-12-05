jQuery(document).ready(function() {
  $("#books_prowellness").easySlider({ 
     numeric: true,
     numericId:'prowellness'
   });
   
   $("#other_books").easySlider({ 
      numeric: true,
      numericId:'others'
    });

   $('#prowellness > li > a').click(function(ev){
      var index = $(this).attr('rel');
      updateCurrentBook(index);
   });
   
});

function showBook(index){
   var el = $('#prowellness').children('li');
   el.eq(index).children('a').click();
}

function updateCurrentBook(index){
   $('#main-book-option').children('.current').removeClass('current');
   $('#main-book-option').children('a').eq(index).addClass('current');
}
