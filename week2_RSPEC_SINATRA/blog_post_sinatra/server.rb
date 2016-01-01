require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './lib/blog.rb'
require_relative './lib/post.rb'

my_post = Blog.new
post1 = Post.new("post1","este es el primer post")
post2 = Post.new("post2","este es el segundo post")
post3 = Post.new("post3","este es el tercer post")
my_post.add_post(post1)
my_post.add_post(post2)
my_post.add_post(post3)

# enable(:sessions)


get "/" do
	@my_list = my_post.post_list
	erb(:posts)
end

post "/" do
	if params[:reverse] == "yes"
		@my_list = my_post.latest_posts	
	else
		my_post.post_list.reverse!

		redirect to('/')
	end

	erb(:posts)
end

get "/details/:title" do
	my_list = my_post.post_list
	my_list.each do |post|
		if post.title == params[:title]
			@this_post = post
		end
	end
	@this_post
	erb(:post_details)
end


get "/new_post" do
	erb(:new_post)
end

post "/new_data" do
	
	post_title = params[:title]
	content_post = params[:text]
	post4 = Post.new(post_title,content_post)
	my_post.add_post(post4)
	redirect to('/')
end





