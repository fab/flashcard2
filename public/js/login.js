$(document).ready(function(){


  $('#login_link').click(function(e){
    e.preventDefault();
    var login_box = $('#login_box');
    if(login_box.is(":visible")){
      login_box.slideUp("slow");
    }else{
      login_box.slideDown("slow");
    }
  });
});
