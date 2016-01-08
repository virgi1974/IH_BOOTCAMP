// ------------- FIND SONG -------------
function findSong() {

  event.preventDefault();
  console.log('getting song');
  var my_search = $('#my-search').val();

  var url_song = 'https://api.spotify.com/v1/search?q=' + my_search + '&type=track';
  var request = $.ajax({
    type: 'get',
    url: url_song,
    success: onSaveSuccess,
    error: onSaveFailure
  });

  function onSaveSuccess (response) {
    showSong(response);
  }
  function onSaveFailure (err) {
    console.error(err.responseJSON);
  }

  function showSong(response1){

    var results = response1['tracks'].items;

      for (var i = 0; i < 10; i++) {
        var track_preview = results[i].preview_url;
        var track_name = results[i].name;
        var track_author = results[i]['artists'][0].name;
        var track_cover = results[i]['album']['images'][0].url;
        var track_artist = results[i]['artists'][0].id;

        loadImages(track_name,track_author,track_cover,track_artist,track_preview);
      }
      
      setPlayer(track_name,track_author,track_cover,track_artist,track_preview);

      // $('#audio-track').attr('src',track_preview);
      // $('.title').text(track_name);
      // $('.author').text(track_author);
      // $('.cover img').attr('src',track_cover);
      // $('#info-artist').attr('href',track_artist);

  }

} // findSong - end
// ------------- FIND ARTIST-INFO -------------
function findArtist(artist_id) {
  var url_artist = 'https://api.spotify.com/v1/artists/' + artist_id;
  var request = $.ajax({
    type: 'get',
    url: url_artist,
    success: onSaveSuccess,
    error: onSaveFailure
  });

  function onSaveSuccess (response) {
    // console.log('inside artist-info');
    showArtist(response);
  }
  function onSaveFailure (err) {
    console.error(err.responseJSON);
  }

 function showArtist(response2){

    var followers =response2.followers.total;
    var name =response2.name;
    var popularity =response2.popularity;
    var genres =response2.genres;

    // ------------ MODAL INFO ------------

    $('.modal-body').append('<p>Name: ' + name + '</p>');
    $('.modal-body').append('<p>followers: ' + followers + '</p>');
    $('.modal-body').append('<p>popularity: ' + popularity + '</p>');
    
    if (genres.length > 0) {
      $('.modal-body').append('<ul>Genres');
        for (var i = 0; i < genres.length; i++) {
          $('.modal-body').append('<p>Name: ' + genres[i] + '</p>');
        }
      ('.modal-body').append('</ul>');
    }

    $('.js-modal').modal('show');
  };
   
} // findArtist

//gallery of images
function loadImages(title,author,cover,id,trackPreview){
  var htmlParts = [
    '<div id="' + id + '" class="col-md-2 thumb-container">',
    '<p>' + author+ '</p>',
    '<p><em>' + title + '</em></p>',
    '<img class="thumb" src="' + cover + '">',
    '<div id="' + trackPreview + '" style="visibility: hidden"></div>',
    '</div>'
  ];

$('.img-container').append(htmlParts.join('\n'));
};

//set the player info
function setPlayer(track_name,track_author,track_cover,track_artist,track_preview){
  $('#audio-track').attr('src',track_preview);
  $('.title').text(track_name);
  $('.author').text(track_author);
  $('.cover img').attr('src',track_cover);
  $('#info-artist').attr('href',track_artist);
};
//--------------------------  CALLS ----------------------------------

//FIND SONG

$('#my-form').on('click',function(){
  findSong();
});

// PLAY/PAUSE 

$('.btn-play').on('click',function(){
  var $button = $('.btn-play');
  if ($button.hasClass('playing')) {
    $('.btn-play').removeClass('playing');
    $('#audio-track').trigger('pause');
    $('.btn-play').addClass('disabled');
  }else{
    $('.btn-play').addClass('playing');
    $('#audio-track').trigger('play'); 
    $('.btn-play').removeClass('disabled');
    // console.log($('#audio-track').prop('currentTime'));
  };
});

// Callback function to print the player's current time
function printTime () {
  var current = $('#audio-track').prop('currentTime');
  console.debug('Current time: ' + current);
  $('.seekbar progress').attr('value',current);

}

// Have printTime be called when the time is updated
$('#audio-track').on('timeupdate', printTime);

// ARTIST INFO

$('#info-artist').on('click',function(event){
  event.preventDefault();
  var $button = $(event.currentTarget);
  var artist_id = $button.attr('href');
  // console.log(artist_id);
  findArtist(artist_id);
  
});

//
$(document).on('click','.thumb-container',function(event){
  event.preventDefault();
  var id = $(event.currentTarget).attr("id"); 
  var author = $(event.currentTarget.children[0]).text();
  var title = $(event.currentTarget.children[1]).text();
  var cover = $(event.currentTarget.children[2]).attr('src');
  var preview = $(event.currentTarget.children[2]).attr('src');

  setPlayer(title,author,cover,id,preview);
});





   






