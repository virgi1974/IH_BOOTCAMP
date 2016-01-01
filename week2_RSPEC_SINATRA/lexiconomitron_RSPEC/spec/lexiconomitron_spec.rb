require_relative '../lexiconomitron.rb'

RSpec.describe "Lexiconomitron" do
before :each do
@lexi = Lexiconomitron.new	
end
		

	it "check that returns a string" do
		expect(@lexi.eat_t("word")).to eq("word")
	end

	it "check that return a string without -t" do
		expect(@lexi.eat_t("time")).to eq("ime")
	end

	it "check that return a string without -T" do
		expect(@lexi.eat_t("time To go")).to eq("ime o go")
	end

	# it "check that return an array" do
	# 	expect(@lexi.shazam("hello world")).to eq(["hello","world"])
	# end

	it "check that return a reverse array" do
		expect(@lexi.reverse("pete hola")).to eq(["etep","aloh"])
	end

	it "check that return a reverse array" do
		expect(@lexi.shazam("Tepe hola")).to eq(["epe","aloh"])
	end

	it "check that return just words <= 3" do
		expect(@lexi.oompa_loompa("If you wanne be my lover")).to eq(["If","you", "be", "my"])
	end



end


