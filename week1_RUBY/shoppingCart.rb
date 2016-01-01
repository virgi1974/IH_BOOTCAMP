require 'pry'

# "mother" class sets the name property
class Fruit
	attr_accessor :name
	
	def initialize name
		@name = name
	end
end

# fruit classes
class Apple < Fruit
	
	def initialize
		super("apple")
	end
	
end

class Banana < Fruit
	def initialize
		super("banana")
	end
end

class Orange < Fruit
	def initialize
		super("orange")
	end
end

class Watermelon < Fruit
	def initialize
		super("watermelon")
	end
end
class Grape < Fruit
	def initialize
		super("grape")
	end
end

#discounts in a module
module Discount
	
		def initialize
			@disc_apples = 0
			@disc_oranges = 0
			@disc_grapes = 0
		end

		def discount_2apples
			@my_total.each do |fruit|
				if fruit[:name] == "apple" && fruit[:total] >= 2
					@disc_apples = (fruit[:total] / 2).floor *  fruit[:price]
				end
			end
			@disc_apples
		end

		def discount_3oranges
			@my_total.each do |fruit|
				if fruit[:name] == "orange" && fruit[:total] >= 3
					@disc_oranges = (fruit[:total] / 3).floor *  fruit[:price]
				else
				@disc_oranges = 0
				end
			end
			@disc_oranges
		end

		def discount_4grapes 
			@my_total.each do |fruit|
				if fruit[:name] == "grape" && fruit[:total] >= 4
					puts "do you want some free bananas? / yes / ?"
					answer = gets.chomp
						if answer == "yes"
							@disc_grapes = (fruit[:total] / 4).floor 
						else
						@disc_grapes = 0
						end
				end
			end
			@disc_grapes
		end
end

class ShoppingCart

	include Discount

	def initialize(season_obj)
		@catalogue = season_obj.get_table_prices
		binding.pry
		@my_shop = []
		@counter = Hash.new(0)
		@my_total = []
	end

	def add_item_to_cart(fruit)
		@catalogue.each do |data|
			if data[fruit]
				@my_shop << data[fruit].new
			end
		end
	end

	def cost
		count
		show
		@my_total.each do |fruit|
			if fruit[:name] == "apple"
				puts "#{fruit[:total]} #{fruit[:name]} --> #{(fruit[:total] * fruit[:price]) - discount_2apples} $"
			elsif fruit[:name] == "orange"
				puts "#{fruit[:total]} #{fruit[:name]} --> #{(fruit[:total] * fruit[:price]) - discount_3oranges} $"
			elsif fruit[:name] == "banana"
				total_bananas = 2*fruit[:total] #+ discount_4grapes
				puts "#{fruit[:total]  + total_bananas} #{fruit[:name]} --> #{(fruit[:total] * fruit[:price])} $"
			else
				puts "#{fruit[:total]} #{fruit[:name]} --> #{(fruit[:total] * fruit[:price])} $"
			end
		end
		
	end

	def count
		@my_shop.each do |fruit|
			@counter[fruit.name] += 1
		end
	end
	
	def show
		@catalogue.each do |array| 
			@counter.each do |key,value|
				if array[key.to_sym]
					my_hash = {}
					my_hash[:name] = key
					my_hash[:total] = value
					my_hash[:price] = array[:price]
					@my_total << my_hash
				end
			end

		end

		@my_total = @my_total.uniq
	end
end


# a class with the different table-prices --> will be injected in the cart
class SeasonPrices

	def initialize season
		@season = season
	end

	def get_table_prices 

			case @season

			when "Spring"
					list_fruits = [{:apple => Apple, :price => 10},
				{:orange => Orange, :price => 5},
				{:grape => Grape, :price => 15},
				{:banana => Banana, :price => 20},
				{:watermelon => Watermelon, :price => 10}]
			when "Summer"
					list_fruits = [{:apple => Apple, :price => 10},
				{:orange => Orange, :price => 2},
				{:grape => Grape, :price => 15},
				{:banana => Banana, :price => 20},
				{:watermelon => Watermelon, :price => 10}]
			when "Autumn"
							list_fruits = [{:apple => Apple, :price => 15},
				{:orange => Orange, :price => 5},
				{:grape => Grape, :price => 15},
				{:banana => Banana, :price => 20},
				{:watermelon => Watermelon, :price => 10}]
			else
					list_fruits = [{:apple => Apple, :price => 12},
				{:orange => Orange, :price => 5},
				{:grape => Grape, :price => 15},
				{:banana => Banana, :price => 21},
				{:watermelon => Watermelon, :price => 10}]
			end
			list_fruits
	end
end

# spring_prices = SeasonPrices.new("Spring")
# my_cart = ShoppingCart.new(spring_prices)

autum_prices = SeasonPrices.new("Autumn")
my_cart = ShoppingCart.new(autum_prices)

my_cart.add_item_to_cart(:apple)
my_cart.add_item_to_cart(:apple)
my_cart.add_item_to_cart(:apple)
my_cart.add_item_to_cart(:apple)
my_cart.add_item_to_cart(:banana)
my_cart.add_item_to_cart(:grape)
my_cart.add_item_to_cart(:orange)
# my_cart.add_item_to_cart(:grape)
# my_cart.add_item_to_cart(:grape)
# my_cart.add_item_to_cart(:banana)
# my_cart.add_item_to_cart(:banana)

my_cart.cost

















