//= require jquery.stylish-select.min
//= require custom-form-elements
//= require jquery.ui.datepicker-es

jQuery(document).ready(function($) {
    
  $('.toggle_filters').live('click',function(e){
    $('.filters').slideToggle('fast');
    e.stopPropagation(); e.preventDefault();
  });
  
  // this function has all the necessary to recall the js stuf in each ajax pagination call
  reload_page();
  
});


function reload_page() {

  if ($('.custom-select').length > 0){
    $('.custom-select').sSelect();
  }

  $('.filters').hide();
    
  var dates = $( "#date_from, #date_to" ).datepicker({
    changeMonth: true,
    numberOfMonths: 1,
    onSelect: function( selectedDate ) {
      var option = this.id == "date_from" ? "minDate" : "maxDate",
      instance = $( this ).data( "datepicker" ),
      date = $.datepicker.parseDate(
        instance.settings.dateFormat ||
        $.datepicker._defaults.dateFormat,
        selectedDate, instance.settings );
        dates.not( this ).datepicker( "option", option, date );

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        // Set value to the select_date element rails
        if (this.id == 'date_from'){
          $('#from_day').val(day);
          $('#from_month').val(month);
          $('#from_year').val(year);
        }else {
          $('#to_day').val(day);
          $('#to_month').val(month);
          $('#to_year').val(year);
        }

      }
    },$.datepicker.regional["es"]);
    
    $('.question').click(function(event) {
      event.preventDefault();
      MODAL.open('#abdo-levels');
    });
}