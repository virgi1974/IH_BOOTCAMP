var User = function(name){
	this.name = name;
	this.currentPoints = 0;
	this.questionNumber = 0;
}
User.prototype.getPoints = function(){
	return this.currentPoints;
}
User.prototype.setPoints = function(num){
	this.currentPoints = num;
}
User.prototype.setQuestionNumber = function(num){
	this.questionNumber = num;
}
User.prototype.saveGame = function(num){
	this.questionNumber = num;
}
module.exports.User = User;