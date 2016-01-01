require 'pry'
class Blog
	attr_accessor :post_list

	 def initialize
	# 	@title_blog = "blog"
	 	@post_list = [] # all the possible results

	# 	@post_list2 = [] # contains groups of 3 posts
	# 	@pag = 3 #number of results x screen
	# 	@num_pages = 0
	# 	@position = 0
	 end

	def add_post(post_obj)
		
		@post_list.push(post_obj) 
	end

	# def add_sponsored_post(post_obj)
	# 	post_obj.sponsored = true
	# 	@post_list.push(post_obj) 
	# end
	# # it publishes all the posts in a row
	# def publish_front_page
	# 	system 'clear'
	# 	@post_list.each do |post|
	# 		if post.sponsored == true
	# 			puts "*****Post #{post.title}*****"
	# 		else
	# 			puts "Post #{post.title}"
	# 		end
	# 		puts "#{post.text}"
	# 		puts "#{post.creation_date}"
	# 		puts "-----------------------"
	# 	end
	# end

	# def create_front_page
	# 	order
	# 	publish_front_page
	# end

	def latest_posts
		@post_list = @post_list.sort_by { |post| post.creation_date}
		@post_list.reverse!
	end

# ---------- PAGINACION ---------------

	# def paginacion
	# 	order
	# 	@post_list.each_slice(("#{@pag}").to_i){|post| @post_list2 << post }
	# 	create_front_page_paginada
	# end

	# # it publishes post 3 at a time
	# def create_front_page_paginada
	# 	system 'clear'
	# 	@num_pages = @post_list2.length
	# 	@post_list2[("#{@position}").to_i].each_with_index do |post,index|
			
	# 			if post.sponsored == true
	# 				puts "*****Post #{post.title}  #{index}*****"
	# 			else
	# 				puts "Post #{post.title}  #{index}"
	# 			end
	# 			puts "#{post.text}"
	# 			puts "#{post.creation_date}"
	# 			puts "-----------------------"
	# 	end		

	# 	if @position > 0 && @position < @num_pages
	# 		back_pages = (1..@position).to_a
	# 		puts "back"
	# 		back_pages.each { |pg| puts pg}
			
	# 	end
	# 	if @position < (@num_pages - 1)
	# 		next_pages = (@position+2..@num_pages).to_a
	# 		puts "next"
	# 		next_pages.each { |pg| print "#{pg} " }
	# 	end

	# 		answer = gets.chomp
	# 		if answer == "back" && @position != 0
	# 			@position-=1
	# 			create_front_page_paginada
	# 		elsif answer == "back" && @position == 0
	# 			create_front_page_paginada

	# 		elsif answer == "next" && @position == @num_pages-1
	# 			create_front_page_paginada
	# 		elsif answer == "next" && @position != @num_pages-1
	# 			@position+=1
	# 			create_front_page_paginada
	# 		else
	# 			puts "ERROR --> ENTER VALID ANSWER"
	# 			create_front_page_paginada
	# 		end
	# end
	
end

#------------------------------------------------

# post1 = Post.new("deportes","este es mi primer blog")
# post2 = Post.new("pesca","este es mi segundo blog")
# post3 = Post.new("caza","este es mi tercer blog")
# post4 = Post.new("time","cuarto prueba fecha")
# post5 = Post.new("nada","este es mi quinto blog")
# post6 = Post.new("poco","este es mi sexto blog")
# post7 = Post.new("todo","este es mi septimo blog")
# post8 = Post.new("a veces","este es mi octavo blog")

# blog_virgi = Blog.new
# blog_virgi.add_post(post1)
# blog_virgi.add_post(post2)
# post4.clean = 20141027 # fixed "clean"-time value to check order
# blog_virgi.add_post(post4)
# blog_virgi.add_sponsored_post(post3)
# blog_virgi.add_post(post5)
# blog_virgi.add_post(post6)
# post7.clean = 20131027 # fixed "clean"-time value to check order
# blog_virgi.add_post(post7)
# blog_virgi.add_post(post8)

# #blog_virgi.create_front_page
# blog_virgi.paginacion





