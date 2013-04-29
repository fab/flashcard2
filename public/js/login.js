


var hideBox = function(target){target.slideUp("slow");};
var showBox = function(target){target.slideDown("slow");};
var updateHeader = function(){
  $('.header').load('/header');
};

var login_click = function(e){
  var login_box = $('.login_box');
  var register_box = $('.register_box');

  if(login_box.is(":visible")){

    hideBox(login_box);
  }else{
    if(register_box.is(":visible")){
      hideBox(register_box);
    }
    $('.login_box').slideDown("slow");

    showBox(login_box);
  }
};


var register_click = function(){
  var login_box = $('.login_box');
  var register_box = $('.register_box');
  if(register_box.is(":visible")){
    hideBox(register_box);
  }else{
    if(login_box.is(":visible")){
      hideBox(login_box);
    }
    showBox(register_box);
  }
};

var login_event = function(e){
  var login_form = $('.login_form');
  var login_box = $('.login_box');
  e.preventDefault();
  $.ajax({
    type:'post',
    url:'/login',
    data:login_form.serialize()
  }).done(function(data){

    console.log(login_box);
    hideBox(login_box);
    updateHeader();
    $('.main').html(data);
  }).fail(function(a,b,c){
    $('.login_box_errors').html('Invalid email or password.');
  });
};

var register_event = function(e){
  var register_form = $('.register_form');
  var register_box = $('.register_box');
  e.preventDefault();
  $.ajax({
    type:'post',
    url:'/register',
    data:register_form.serialize()
  }).done(function(data){
    if (data.length<200){
      $('.register_box_errors').html(data);
    }else{
      hideBox(register_box);
      updateHeader();
      $('.main').html(data);
    }
  });
};






$(document).on('click', '.login_link', function(){login_click();});
$(document).on('click', '.register_link', function(){register_click();});
$(document).on('submit', '.login_form', function(e){login_event(e);});
$(document).on('submit', '.register_form', function(e){register_event(e);});

$(document).ready(function(){

});
