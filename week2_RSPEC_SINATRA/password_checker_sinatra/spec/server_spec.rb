require_relative '../server.rb'
require 'pry'
require 'rspec'
require 'rack/test'

describe 'Server service' do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	it "should load the home page with the login form" do
		get '/'
		expect(last_response).to be_ok
	end

	it "should post the info to /login for the info process" do
		post '/login'
		expect(last_response).to be_ok
	end

	it "welcomes the authorized user" do
		get '/congratulations'
		expect(last_response).to be_ok
	end
end