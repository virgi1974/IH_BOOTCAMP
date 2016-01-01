require_relative '../server.rb'
require 'pry'
require 'rspec'
require 'rack/test'

describe 'Server service' do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	it "should load the home page with all the posts" do
		get '/'
		expect(last_response).to be_ok
	end

	it "should load the home page with the latest posts first" do
		post '/'
		expect(last_response).to be_ok
	end

	it "create a new post" do
		get '/new_post'
		expect(last_response).to be_ok
	end



	# it "should load the details page for every post" do
	# 	get '/post1/este es el primer post'
	# 	expect(last_response).to be_ok
	# end






	# it "should load the home page" do
	# 	get '/'
	# 	expect(last_response).to be_ok
	# end
	# #este es un mal test porque pasa a la primera
	# it "should not load the home page" do
	# 	get '/home'
	# 	expect(last_response).to_not be_ok
	# end

	# it "should  load the other page" do
	# 	get '/real_page'
	# 	expect(last_response).to be_ok
	# end

	# it "should redirect to the real_page" do
	# 	get '/hi'
	# 	expect(last_response.redirect?).to be(true)
	# 	follow_redirect!
	# 	expect(last_request.path).to eq('/real_page')
	# end



end




# RSpec.describe "word counter" do
# 	# describe "EmailProvider has no strings-->comes empty" do
# 		it "should return true if no words is given" do
# 			# provider = EmailProviderFake.new([])
# 			provider = instance_double("EmailProvider",:get_subjects => [])

# 			counter = WordChecker.new(provider.get_subjects)
# 			expect(counter.check([])).to eq(true)
# 		end
# end