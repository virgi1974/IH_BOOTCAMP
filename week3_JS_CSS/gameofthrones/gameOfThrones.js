var fs = require('fs');
// ITERATION 1
function fileActions1(err, file){ 
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);

    for (var i = 0; i < episodes.length; i++){
    	console.log("Title: " + episodes[i].title + "  #: " + episodes[i].episode_number + "\r\n");
    	console.log("Description: " + episodes[i].description + "\r\n");
    	console.log("Rating: " + episodes[i].rating + "\r\n");
    }
}
// fs.readFile("./GoTEpisodes.json", 'utf8', fileActions1);
// ITERATION 2
function fileActions2(err, file){ 
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);

    for (var i = 0; i < episodes.length; i++){
    	console.log("Title: " + episodes[i].title + "  #: " + episodes[i].episode_number + "\r\n");
    	console.log("Description: " + episodes[i].description + "\r\n");
    	console.log("Rating: " + episodes[i].rating + "  ************\r\n");
    }
}
// fs.readFile("./GoTEpisodes.json", 'utf8', fileActions2);
// ITERATION 3
function fileActions3(err, file){ 
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    	var newEpisodes = episodes.sort(function(a,b){
            if (a.episode_number > b.episode_number) {
                return 1;
    		  // console.log(a.episode_number);
            }else if(a.episode_number < b.episode_number){
                return -1;
                // console.log(b.episode_number);
            }else{
                return 0;
            };
    	})    
        console.log(newEpisodes); 
}
//fs.readFile("./GoTEpisodes.json", 'utf8', fileActions3);

// ITERATION 4
function under8(eachEpisode) {
  return eachEpisode.rating < 8.5;
}
function fileActions4(err, file){ 
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    var filtered_episodes = episodes.filter(under8);
           
    console.log(filtered_episodes); 
}
// fs.readFile("./GoTEpisodes.json", 'utf8', fileActions4);

// CHALLENGE MODE
function containsJonSnow(episode) {
  var description_a = episode.description.trim().split(" ");
  for (var i = 0; i < description_a.length; i++) {
      if (description_a[i] === 'Jon' && description_a[i + 1] === 'Snow') {
   
      return episode;
    };
   
  };
}
function challengeMode(err, file){ 
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    var jon_episodes = episodes.filter(containsJonSnow);
           
    console.log(jon_episodes); 
}

fs.readFile("./GoTEpisodes.json", 'utf8', challengeMode);










