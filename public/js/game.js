$(document).ready(function() {
  var counter = 0;
  $('#definition_' + counter).removeClass('hidden').addClass('active');
  $('#answer_' + counter).removeClass('hidden').addClass('active');
  $('.hidden').hide();
  // set class to active where id's have counter value
  $('#next_card_btn').on('click', function() {
    counter += 1;
    $('.active').removeClass('active').addClass('hidden');
    $('#definition_' + counter).removeClass('hidden').addClass('active');
    $('#answer_' + counter).removeClass('hidden').addClass('active');
    $('.hidden').hide();
    $('.active').show();
    // set class to active where id's have counter value
  });
});
