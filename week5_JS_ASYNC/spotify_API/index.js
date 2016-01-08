// main search for a band
$('#get_spotify').on('click',function(){
  spotify();
});

function spotify() {
  event.preventDefault();
  console.log('getting data from the Spotify API');
  var my_search = $('#search').val();

  var new_url = 'https://api.spotify.com/v1/search?type=artist&query=' + my_search;
  var request = $.ajax({
    type: 'get',
    url: new_url,
    success: onSaveSuccess,
    error: onSaveFailure
  
  });

  function onSaveSuccess (response) {
    showBands(response);
  }
  
  function onSaveFailure (err) {
    console.error(err.responseJSON);
  }

 function showBands(objects){
    var results = objects['artists'].items;

    $('#results').empty();
      for (var i = 0; i < results.length; i++) {
        $('#results').append('<div class="artist"><a class="li-album" href="#"><p id="' + results[i].id + '">' + results[i].name + '</p></a>');
          if (results[i].images.length !== 0) {
            $('#'+results[i].id).append('<img src="' + results[i].images[0].url + '" alt="">'); 
          };
        $('#results').append('</div>'); 
      };

  }

}//end of "spotify"

//-----------------------------------------------

// we search the albums of a specific band
$(document).on('click', '.li-album', function(event){ //DELEGACION DE EVENTOS!!!!!!!!
  event.preventDefault();
  var currentDOMElement = $(event.currentTarget);
  var id = $(event.currentTarget.children).attr("id");
  showAlbums(id);
  $('#myModal').modal('show');
});

function showAlbums(id) {

  var new_url = 'https://api.spotify.com/v1/artists/' + id + '/albums';

  var request = $.ajax({
    type: 'get',
    url: new_url,
    success: onSaveSuccess,
    error: onSaveFailure,
  });

  function onSaveSuccess (response) {
    artistAlbums(response);
  }

  function onSaveFailure (err) {
    console.error(err.responseJSON);
  }

  function artistAlbums(albums){
    var result = albums['items'];

    $('#albums').empty();
    $('#albums').append('<div><ul>'); 
      for (var i = 0; i < result.length; i++) {
        $('#albums').append('<a href="#" data-toggle="modal" data-target="#myTracksModal" class="li-tracks"><li id="' + result[i].id + '">' + result[i].name + '</li></a>'); 
      };
    $('#albums').append('</ul></div>'); 
  }

}// showalbums

//---------------------------------------

$(document).on('click', '.li-tracks', function(event){ //DELEGACION DE EVENTOS!!!!!!!!
  event.preventDefault();
  var currentDOMElement = $(event.currentTarget);
  var id = $(event.currentTarget.children).attr("id");
  showTracks(id);
  $('#myModal').modal('show');
});

function showTracks(id) {
  var new_url = 'https://api.spotify.com/v1/albums/' + id + '/tracks';   
  
  var request = $.ajax({
    type: 'get',
    url: new_url,
    success: onSaveSuccess,
    error: onSaveFailure,
  });

  function onSaveSuccess (response) {
    albumTracks(response);
  }

  function onSaveFailure (err) {
    console.error(err.responseJSON);
  }

  function albumTracks(tracks){

    var result = tracks['items'];
    $('#albums').empty();
    $("#modal-title").text('TRACKS');
    $('#albums').append('<div><ul>'); 
      for (var i = 0; i < result.length; i++) {
        $('#albums').append('<a href="' + result[i].preview_url + '" target="_blank" class="url-preview"><li>' + result[i].name + '</li></a>'); 
      };
    $('#albums').append('</ul></div>'); 

  }


}












