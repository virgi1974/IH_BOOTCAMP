require 'pry'
require 'sinatra'
# require 'sinatra/reloader' if development?
require_relative './lib/logic.rb'

enable(:sessions)

get "/" do
	erb(:welcome)
end

post "/login" do
	
	email = params[:username]
	password = params[:password]
	@check = Passwordchecker.new.check_all(email,password)
	
	if @check == true
		session[:email] = email
		redirect to("/congratulations")
	else
		redirect to("/")
	end
end

get "/congratulations" do
	@user = session[:email]
	erb(:congratulations)
end

