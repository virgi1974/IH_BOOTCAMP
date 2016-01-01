require 'pry'
require "rspec"

class Lexiconomitron
	def eat_t phrase
		str_1 = phrase.gsub(/t|T/, '')
	end

	def reverse phrase
		phrase.split(" ").map! do |word|
			word.reverse
		end
	end

	def shazam phrase_a
		array_clean =reverse phrase_a
		array_clean.map! do |word|
			eat_t(word)
		end
	end

	def  oompa_loompa phrase
		str_clean = eat_t(phrase)
		phrase_a = str_clean.split(" ")

		phrase_b = phrase_a.select do |word|
			word.length <= 3
		end
	end
end
