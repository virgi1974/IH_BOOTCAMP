require_relative '../lib/calculator.rb'
require 'pry'

RSpec.describe "Calculator class" do
	before :each do
		@calc = Calculator.new
	end

	describe "#add" do
		it "returns 2 for 1 + 1" do
			expect(@calc.add(1,1)).to eq(2)
		end
	end

	describe "#substract" do
		it "returns 0 for 1 - 1" do
			expect(@calc.substract(1,1)).to eq(0)
		end
	end

	describe "#multiply" do
		it "returns 4 for 2 * 2" do
			expect(@calc.multiply(2,2)).to eq(4)
		end
	end

	describe "#divide" do
		it "returns 4 for 8 / 2" do
			expect(@calc.divide(8,2)).to eq(4)
		end

		it "returns nil if num2 == 0" do
			expect(@calc.divide(1,0)).to eq("IND")
		end
	end
end