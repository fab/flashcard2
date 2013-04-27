$(document).ready(function() {
  var counter = 0;
  var count = $('.hidden').length;
  console.log(count);
  $('#definition_' + counter).parent().removeClass('hidden').addClass('active');
  $('.hidden').hide();
  $('#next_card_btn').on('click', function() {
    if (count == count) {
      //display end of deck message
    }
    else {
      counter += 1;
      $('.active').removeClass('active').addClass('hidden');
      $('#definition_' + counter).parent().removeClass('hidden').addClass('active');
      $('.hidden').hide();
      $('.active').show();
    }
  });
});
