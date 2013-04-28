var showInfo = function(){
  $('.deck_preview').mouseover(function(){
    $(this).next().fadeIn("fast");
  });
};

var hideInfo = function(){
  $('.deck_info').mouseout(function(){
    $(this).fadeOut("fast");
  });
};

$(document).on('mouseover', '.deck_preview', function(){showInfo();});
$(document).on('mouseout', '.deck_info', function(){hideInfo();});
$(document).on('click', '.deck_info', function(){
    console.log('You clicked deck_info');
    var deck_id = $(this).find('.deck_id').val();
    window.location = '/deck/'+ deck_id +'/play';
  });
