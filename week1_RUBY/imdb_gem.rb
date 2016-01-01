require 'imdb'
require 'pry'

class Movie
	def initialize
		@file_titulos = "titulos.txt"
		@array_titulos = []
		@movie_marks = []
	end

	def read_file
		@content = IO.read(@file_titulos)
		@array_titulos = @content.split("\n")
	end

	def search_imdb
		
		@array_titulos = @array_titulos.map do |film|
     	imdb_film = Imdb::Search.new(film) 
   	end 
	end

	def first_5_results
		@array_titulos.each do |imdb_search|
			imdb_search.movies.each_with_index do |imdb_movie,index|
				@movie_marks << [imdb_movie.title,imdb_movie.rating]
					break if index == 4 #we choose few results in order to not overload the imdb api
			end
		end
	end

	def order_by_rating
		 @movie_marks = @movie_marks.select {|movie| movie[1] != nil}
		 @movie_marks = @movie_marks.sort_by {|movie| movie[1]}.reverse
	end

	def print_top_ten
		read_file
		search_imdb
		first_5_results
		order_by_rating

		@movie_marks.each do |movie|
			puts "the movie #{movie[0]} has a rating of #{movie[1]} points"
		end
	end

end #Movie


my_movie = Movie.new
my_movie.print_top_ten