$(document).ready(function() {
  var nextCard = function() {
    counter += 1;
    if (counter == num_cards) {
      $('.active').hide();
      alert('The deck is empty!');
      //display end of deck message
    }
    else {
      $('.active').removeClass('active').addClass('hidden');
      $('#definition_' + counter).parent().removeClass('hidden').addClass('active');
      $('.hidden').hide();
      $('.active').show();
    }
  };
  console.log('howdy1');
  var counter = 0;
  var num_cards = $('.hidden').length;
  $('#definition_' + counter).parent().removeClass('hidden').addClass('active');
  $('.hidden').hide();
  // $('#next_card_btn').on('click', nextCard());

  // Change colour of selected button

  $('.answers').children().on('click', function (e){
    console.log($(this).siblings());
    $(this).siblings().unbind('click');
    e.preventDefault();
  var card_id = $('.active').find('input').val();
  var answer = $(this).text();
  $(this).addClass('clicked');
  // console.log(card_id);
  // console.log(answer);
  // console.log($(this));
  $.ajax({
    type: 'post',
    url: '/check_answer',
    data: "card_id=" + card_id + "&answer=" + answer
  }).done(function(data){
    console.log(data);
    if(data == "true"){
      // console.log($(this));
      $('.clicked').addClass('correct');
    }else{
      // console.log($(this));
      $('.clicked').addClass('wrong');
    }
    setTimeout(nextCard, 500);
  });
  });
});

