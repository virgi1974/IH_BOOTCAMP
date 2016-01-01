require 'pry'
require 'sinatra'
require_relative './lib/calculator.rb'

get "/" do
	@previous = ""
	
	erb(:web_calculator)
end

post "/" do
	@previous = ""

	if params[:previous_result] != ""
		@previous = params[:previous_result]
	end

	erb(:web_calculator)
end

post "/calculate" do
	calc = Calculator.new
	num1 = params[:first_number].to_f
	num2 = params[:second_number].to_f
	operation = params[:operation]

	@result = 0
	
	case operation
	when "add"
		@result = calc.add num1, num2
	when "substract"
		@result = calc.substract num1, num2
	when "multiply"
		@result = calc.multiply num1, num2
	when "divide"
		@result = calc.divide num1, num2
	end
	
	redirect to("/final_result/#{operation}/#{num1}/#{num2}/#{@result}") #esto es un GET

end

#------------------------- RESULTS PAGE -----------------------

get "/final_result/:operation/:num1/:num2/:result" do
	@num_1 = params[:num1]
	@num_2 = params[:num2]
	@result = params[:result]

	@message = ""
	case params[:operation]
	when "add"
		@message = "The addition of #{@num_1} and #{@num_2} is #{@result}"
	when "substract"
		@message = "The substraction of #{@num_1} and #{@num_2} is #{@result}"
	when "multiply"
		@message = "The multiplication of #{@num_1} and #{@num_2} is #{@result}"
	when "divide"
		@message = "The divition of #{@num_1} and #{@num_2} is #{@result}"
	end

	erb(:final_result)
end