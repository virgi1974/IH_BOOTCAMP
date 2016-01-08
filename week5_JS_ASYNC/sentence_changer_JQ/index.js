$(document).on('ready',function(){
  var phrases = ["birds of a feather flock together","great minds think alike",'not again'];
  
  // SHOW a random sentence
  $('.my-phrases').append(showPhrase()); 

  function showPhrase(){
    var randomPhrase = phrases[Math.floor(phrases.length * Math.random())];
    var p_phrase = '<p><em>' + randomPhrase + '</em></p>';
    return p_phrase;
  }

// ADD new sentence
  $('#change-phrase').on('click',function(){
    $('.my-phrases').empty();
    $('.my-phrases').append(showPhrase());
    loadPhrases();
  });

  $('#list-phrases').hide();

  // ON KEY UP ADD new sentence
  $('#input-sentence').on('focus',function(){
    $("#input-sentence").on( "keyup", function(event) {
      addLi();
      var content = $('#input-sentence').val();
      if(event.which === 13 && content !== ""){ 
        event.preventDefault(); //el submit del formulario es ahora este event
        $('.my-phrases').empty();
        $('.my-phrases').append('<p>' + content + '</p>');
        phrases.push(content);
        $("#input-sentence").val("");
        loadPhrases();
      };
    });
  });

// we create a new li identified by "last" class and update its content on keyup
  function addLi(){
    var new_chain = $('#input-sentence').val();

    if ($('#list-phrases li:last-child').hasClass('last')) {
      $('#list-phrases li:last-child').html(new_chain);
    }else{
      $('#list-phrases').append('<li class="last">' + new_chain + '</li>');
      $('#list-phrases li:last-child').html(new_chain); 
    };
  }
// SHOW list of sentences
  function loadPhrases(){
    highligth();
    $('#list-phrases').empty();
    for (var i = 0; i < phrases.length; i++) {
      if (i === colored_index) {
        $('#list-phrases').append('<li class="red">' + phrases[i] + '<img class="garbage" src="garbage.png" alt=""></li>');
      }else{
        $('#list-phrases').append('<li>' + phrases[i] + '<img class="garbage" src="garbage.png" alt=""></li>');
      };
    };

    var colored_index = 0;
    function highligth(){
      var text_box = $('.my-phrases p').text();
      for (var i = 0; i < phrases.length; i++) {
        if (phrases[i] === text_box) {
          colored_index = i;
        };
      };
    }
  }

// SHOW-HIDE list
  $('#show-hide').on('click',function(){
    loadPhrases();
    $('#list-phrases').slideToggle();
  })

// DELETE li clicked 
  $('#list-phrases').on('click','.garbage',function(event){
    var currentDOMElement = $(event.currentTarget);
    var mi_li = currentDOMElement.closest('li').text();
    deletePhrase(mi_li);
    loadPhrases();
  })

  function deletePhrase(text){
    for (var i = 0; i < phrases.length; i++) {
      if (phrases[i] === text){
        phrases.splice(i,1);
      };
    };
  }

 

})





