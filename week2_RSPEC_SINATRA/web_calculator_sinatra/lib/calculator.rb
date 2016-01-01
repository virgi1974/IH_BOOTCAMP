class Calculator
	attr_reader :num1, :num2

	def initialize
		@file = "./public/last_result.txt"
	end

	def add num1, num2
		num1 + num2
	end

	def substract num1, num2
		num1 - num2
	end

	def multiply num1, num2
		num1 * num2
	end

	def divide num1, num2
		if(num2 == 0)
			"IND"
		else
			num1 / num2
		end
	end

	def save_result number
		IO.write @file, number
	end
end