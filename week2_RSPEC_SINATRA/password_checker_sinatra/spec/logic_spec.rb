require_relative '../lib/logic.rb'
require 'pry'
require 'rspec'
require 'rack/test'


RSpec.describe "Passwordchecker class" do
	
	include Rack::Test::Methods

	before :each do
		@passwordchecker = Passwordchecker.new
	end

	describe "#check_methods" do
		
		it "return false if password is < 7" do
			expect(@passwordchecker.check_length("ss1$sa")).to be(false)
		end

		it "return false if password = s1$sasasasa doesn´t have a capital" do
			expect(@passwordchecker.check_uppercase("$1sasas$$$")).to be(false)
		end

		it "return false if password doesn´t have downcase letters" do 
			expect(@passwordchecker.check_lowercase("11A2233A1")).to be(false)
		end

		it "return false if password doesn´t have a simbol" do 
			expect(@passwordchecker.check_symbol("1aAdsdsA1")).to be(false)
		end
		it "return false if password doesn´t have a number" do 
			expect(@passwordchecker.check_number("ew$&QWEf$")).to be(false)
		end
		it "return false if email doesn´t have a * + @ + * " do 
			expect(@passwordchecker.get_email("@yahoo")).to be(false)
		end
		it "return false if password contains the name or the domain of the email" do 
			expect(@passwordchecker.check_email("virgi@yahoo","virgi12S$")).to be(false)
		end
		it "return false if any of the conditions is not fullfilled" do 
			expect(@passwordchecker.check_all("virgi@yahoo","virgi12S$")).to be(false)
		end

	end

end
