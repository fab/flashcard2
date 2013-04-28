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
$(document).ready(function() {
  $('.deck_holder').click(function(){
    console.log($(this).serialize());
    console.log('help me');
  });

  $('.deck_info').click(function(){
    var deck_id = $(this).find('.deck_id').val();
    window.location = '/deck/'+ deck_id +'/play'
  });
});
