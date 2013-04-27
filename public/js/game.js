$(document).ready(function() {
  var counter = 0;
  var num_cards = $('.hidden').length;
  $('#definition_' + counter).parent().removeClass('hidden').addClass('active');
  $('.hidden').hide();
  $('#next_card_btn').on('click', function() {
    counter += 1;
    if (counter == num_cards) {
      $('.active').hide();
      alert('The deck is empty!')
      //display end of deck message
    }
    else {
      $('.active').removeClass('active').addClass('hidden');
      $('#definition_' + counter).parent().removeClass('hidden').addClass('active');
      $('.hidden').hide();
      $('.active').show();
    }
  });
});
