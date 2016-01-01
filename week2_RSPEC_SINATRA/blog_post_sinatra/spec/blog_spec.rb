require_relative '../server.rb'
require 'pry'
require 'rspec'
require 'rack/test'

RSpec.describe "Blog class" do

	include Rack::Test::Methods

	# def app
	# 	Sinatra::Application
	# end

	before :each do
		@blog = Blog.new
		@post2 = Post.new("post_2","este es mi segundo post")
		@post3 = Post.new("post_3","este es mi tercer post")
	end

	describe "#add_post" do
		it "returns something" do
			expect(@blog.add_post(@post2)).to_not be_nil
		end
	end

	describe "#add_post" do
		it "returns an array with 1 posts" do
			expect(@blog.add_post(@post2)).to include(@post2)
		end
	end
	describe "#add_post" do
		it "returns an array with several posts" do
			expect(@blog.add_post(@post2)).to include(@post2)
			expect(@blog.add_post(@post3)).to include(@post3)
		end
	end
	describe "#latest_posts" do
		it "returns the posts arranged by date" do
			@blog.add_post(@post2)
			@blog.add_post(@post3)
			@blog.latest_posts
			expect(@blog.post_list[0].creation_date < @blog.post_list[1].creation_date).to eq(false)
		end
	end




end