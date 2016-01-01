require_relative '../server.rb'
require 'pry'
require 'rspec'
require 'rack/test'

RSpec.describe "Post class" do

	include Rack::Test::Methods

	# def app
	# 	Sinatra::Application
	# end

	before :each do
		@post = Post.new("post_1","este es mi primer post")
	end

	describe "has a title(attr_accessors)" do
		it "returns blog1" do
			expect(@post.title).to eq("post_1")
		end
	end
	describe "has a title(attr_accessors)" do
		it "returns este es mi primer post" do
			expect(@post.text).to eq("este es mi primer post")
		end
	end
	describe "has a creation_date(attr_accessors)" do
		it "returns current creation time" do
			expect(@post.creation_date).to_not be(nil)
		end
	end

end