require 'pry'


class Post

	attr_accessor :title, :text,:creation_date#, :sponsored, :clean

	def initialize(title,text)
		@title = title
		@text = text
		@creation_date = Time.now
		# @sponsored = false

		#@clean = clean_date #parameter we use to order by date
	end

	# def clean_date
	# 	# we get the date in a number-format like "20141027"
	# 	@creation_date.to_s.split(" ")[0].split("-").join("").to_i
	# end

end


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





