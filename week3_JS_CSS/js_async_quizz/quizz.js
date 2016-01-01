var prompt = require('prompt');
var jsonfile = require('jsonfile');
var fs = require('fs');

var my_module_question = require('./question_module.js');
var Question = my_module_question.Question;

var my_module_user = require('./user_module.js');
var User = my_module_user.User;



prompt.start();
// vars initialization
var question1 = new Question('my real name?','virgi',2);
var question2 = new Question('my real surname?','fernandez',3);
var question3 = new Question('where were you born?','madrid',5);
var theGame = [];
theGame.push(question1);
theGame.push(question2);
theGame.push(question3);

var my_user1 = new User("virgi");
var my_user2 = new User("toni");
var my_user3 = new User("pepe");
var players = [];
// players.push(my_user1);
// players.push(my_user2);
// players.push(my_user3);

var totalPoints = 0;

//QUESTIONS ACTIONS
function makeRandom(){
	var randomnumber = Math.floor(Math.random()*theGame.length);
	theGame[randomnumber].bonus = true;
}
function checkBonus(numQ){
	if (theGame[numQ].bonus === true) {
		totalPoints+= theGame[numQ].getPoints()*2;
		console.log("\nyou got " + (theGame[numQ].getPoints()*2) + " BONUS points!!!!!!");
	}else{
		totalPoints+= theGame[numQ].getPoints();
	};
	console.log("tras el bonus tus puntos totales son --> " + totalPoints);
}

var file = "/Users/virgilio1974/Desktop/IH_week3/dia5/js_exercice/players.json"

function checkSave(user_answer,player,numQ){
	if (user_answer === 'save') {
		player.saveGame(numQ);
		saveToFile();
		console.log('See you next time');
		return "EXIT";
	};
}

function questionAll(numQ,player){
	totalPoints = player.getPoints();

	makeRandom();
	console.log(theGame[numQ].makeQuestion()); //the question
	console.log('enter /save/ in case you want to store this game');
	prompt.start();
	prompt.get(['answer'], function (err, result) {
		if (checkSave(result.answer,player,numQ) == "EXIT") {
			return;
		};

  	console.log(' your answer: ' + result.answer);

  	if ((result.answer === theGame[numQ].getAnswer()) && numQ < theGame.length -1  ) {
  		console.log('CORRECT -- NEXT');

	  	checkBonus(numQ);
	  	player.setPoints(totalPoints);

  		numQ++;
  	  	console.log('\n' + player.name+ ' has ' + player.getPoints() + ' points so far');
  		questionAll(numQ,player);
  	}else if( (result.answer === theGame[numQ].getAnswer()) && numQ === theGame.length -1 ){
			console.log('CORRECT -- GAME ENDED');

			checkBonus(numQ);
			player.setPoints(totalPoints);

			saveToFile();
	console.log('-----------------------');
	console.log('the total number of points of ' + player.name+ ' is ' + player.getPoints());
  	}else{
  		console.log('INCORRECT -- TRY AGAIN');
  		totalPoints-= theGame[numQ].getPoints();
  		player.setPoints(totalPoints);
  		console.log('\n' + player.name+ ' has ' + player.getPoints() + ' points so far');
  		console.log("\nyou got " + player.getPoints() + " points")
  		questionAll(numQ,player);
  	};
  	
	});
}

// LOGIN USERS
function startGame(){
	console.log("New user? yes/no"); //the question
	prompt.get(['answer'], function (err, result) {
  	if ((result.answer === 'yes')) {
  		//LOGIN
			loginFirstTime();										
  	}else{
  		login();
  	};
	});
}

function loginFirstTime(){
	console.log('Enter the user name for this app');
	prompt.get(['answer'], function (err, result) {
	  	console.log("your user name is " + result.answer);
	  	var newUser = new User(result.answer);
	  	loadFromFile();
	  	players.push(newUser);
	  	console.log('Welcome for the first time' + newUser.name);
		questionAll(0,newUser);
	});
}
function login(){
	console.log('LOGIN --- Enter your user name');
		prompt.get(['username'], function (err, result) {
			findUser(result.username);
		});
}
function findUser(name){
	loadFromFile(name);	
}

function isValid(name,playersFromFile){
	players.forEach(function(user){
			if (user.name === name) {
				console.log('welcome again ' + user.name);
				var list = orderPlayers(playersFromFile)   
	       		leaderBoard(list);	
			    questionAll(user.questionNumber,user);
				return;
			}
	});
		console.log('INVALID USERNAME');	
}

// FILE SAVE-LOAD USERS

function loadFromFile(name){
	fs.readFile("./players.json", 'utf8', function fileActions1(err, file){ 

		var playersFromFile = JSON.parse(file);
			for (var i = 0; i < playersFromFile.length; i++){
				var my_user = new User(playersFromFile[i].name);
				my_user.setPoints(playersFromFile[i].currentPoints);
				my_user.setQuestionNumber(playersFromFile[i].questionNumber);
				players.push(my_user);
		   }
		isValid(name,playersFromFile); 
	});	
}

function orderPlayers(playersFromFile){
	var playersOrdered = playersFromFile.sort(function(a,b){
        if (a.currentPoints < b.currentPoints) {
            return 1;
        }else if(a.episode_number > b.episode_number){
            return -1;
        }else{
            return 0;
        };
    }) 
    return playersOrdered
}

function saveToFile(){
	jsonfile.writeFile(file, players, function (err) {
	  console.error(err)
	})
}

//LEADERBOARD
function leaderBoard(players){
	console.log('-------- POINTS -------');
	for (var i = 0; i < players.length; i++) {
		console.log(players[i].name + '  ---------  ' + players[i].currentPoints + ' points');
	};
	console.log('---------------');
}

// THE GAME STARTS
startGame();











