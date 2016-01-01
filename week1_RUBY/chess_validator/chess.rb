require 'pry'
require 'RSpec'
#------ MODULES - movements ---------
module MoveKnigth
	def move_possible_knigth?(origin,destination)

		dif_h = (destination[0]-origin[0]).abs
		dif_v = (destination[1]-origin[1]).abs

		(dif_h == 2 && dif_v == 1) || (dif_v == 2 && dif_h == 1)
	end
end

module MoveKing
	def move_possible_king?(origin,destination)
		mov_vertical = (origin[1] == destination[1]) && (destination[0] == origin[0] + 1 || destination[0] == origin[0] - 1)
		mov_horizontal = origin[0] == destination[0] && ( origin[1] == destination[1] + 1  || origin[1] == destination[1] - 1 )
		mov_vertical || mov_horizontal || check_diagonal(origin,destination)
		# binding.pry
	end

	def check_diagonal(origin,destination)
		dif = (origin[0] - destination[0]).abs
		(origin[1] - destination[1]).abs == dif
 	end
end

module MovePawn
	def move_possible_pawn?(color,origin,destination)
		if color == "b"
			mov_vertical = (origin[1] == destination[1]) && ((destination[0]-origin[0]).abs == 1 || (destination[0]-origin[0]).abs == 2) && (destination[0]-origin[0]) > 0
			mov_vertical
		else
			mov_vertical = (origin[1] == destination[1]) && ((destination[0]-origin[0]).abs == 1 || (destination[0]-origin[0]).abs == 2) && (destination[0]-origin[0]) < 0
			mov_vertical
		end
	end
end

module MoveRook
	def move_possible_rook?(origin,destination)
		mov_horizontal = (origin[0] == destination[0] && origin[1] != destination[1])
		mov_vertical = (origin[1] == destination[1] && origin[0] != destination[0])
		mov_vertical || mov_horizontal
	end
end

module MoveBishop

	def move_possible_bishop?(origin,destination)
		dif = (origin[0] - destination[0]).abs
		(origin[1] - destination[1]).abs == dif
	end
end


#------ PIECE ---------
class Piece

	def initialize color
		@color = color
	end

end

# --------- PIECES -----------
class Rook < Piece
	include MoveRook

	def validate_move(origin,destination)
		if move_possible_rook?(origin,destination)
			puts "LEGAL" #always returns nil!!!!!
			"LEGAL" # this way we can test this method
		else
			puts "ILLEGAL" #always returns nil!!!!!
			"ILLEGAL" # this way we can test this method
		end
	end
end

class Pawn < Piece
	include MovePawn

	def validate_move(origin,destination)
		if move_possible_pawn?(@color,origin,destination) == true
			puts "LEGAL" 
			"LEGAL"
		else
			puts "ILLEGAL" 
			"ILLEGAL"
		end
	end
end


class Bishop < Piece
	include MoveBishop
	
	def validate_move(origin,destination)
		if move_possible_bishop?(origin,destination) == true
			puts "LEGAL" #puts always returns nil!!!!!
			"LEGAL"
		else
			puts "ILLEGAL" #puts always returns nil!!!!!
			"ILLEGAL"
		end
	end
end

class King < Piece
	include MoveKing
	def validate_move(origin,destination)
		if move_possible_king?(origin,destination) == true
			puts "LEGAL" 
			"LEGAL"
		else
			puts "ILLEGAL" 
			"ILLEGAL"
		end
	end
end

class Knigth < Piece
	include MoveKnigth
	def validate_move(origin,destination)
		if move_possible_knigth?(origin,destination) == true
			puts "LEGAL" 
			"LEGAL"
		else
			puts "ILLEGAL" 
			"ILLEGAL"
		end
	end
end

class Queen < Piece
	include MoveRook
	include MoveBishop
	def validate_move(origin,destination)
		if move_possible_rook?(origin,destination) == true && move_possible_bishop?(origin,destination) == true
			puts "LEGAL" 
			"LEGAL"
		else
			puts "ILLEGAL" 
			"ILLEGAL"
		end
	end
end

#------ BOARD ---------
class Board

	def initialize
		@board = []
		@pieces = {bR: Rook,wR: Rook,bQ: Queen,wQ: Queen,bB: Bishop,wB: Bishop,bK: King,wK: King,bN: Knigth,wN: Knigth,bP: Pawn,wP: Pawn}
		
		@positions = { a8: [0,0], b8: [0,1], c8: [0,2], d8: [0,3], e8: [0,4], f8: [0,5], g8: [0,6], h8: [0,7],
          	a7: [1,0], b7: [1,1], c7: [1,2], d7: [1,3], e7: [1,4], f7: [1,5], g7: [1,6], h7: [1,7],
          	a6: [2,0], b6: [2,1], c6: [2,2], d6: [2,3], e6: [2,4], f6: [2,5], g6: [2,6], h6: [2,7],
          	a5: [3,0], b5: [3,1], c5: [3,2], d5: [3,3], e5: [3,4], f5: [3,5], g5: [3,6], h5: [3,7],
          	a4: [4,0], b4: [4,1], c4: [4,2], d4: [4,3], e4: [4,4], f4: [4,5], g4: [4,6], h4: [4,7],
          	a3: [5,0], b3: [5,1], c3: [5,2], d3: [5,3], e3: [5,4], f3: [5,5], g3: [5,6], h3: [5,7],
          	a2: [6,0], b2: [6,1], c2: [6,2], d2: [6,3], e2: [6,4], f2: [6,5], g2: [6,6], h2: [6,7],
          	a1: [7,0], b1: [7,1], c1: [7,2], d1: [7,3], e1: [7,4], f1: [7,5], g1: [7,6], h1: [7,7]}
        @origin = []
        @destination = []
	end

	def fill_board
		8.times{@board.push(Array.new(8,nil))}
		@board[0] = [:bR,:bN,:bB,:bQ,:bK,:bB,:bN,:bR]
		@board[1] = [:bP,:bP,:bP,:bP,:bP,:bP,:bP,:bP]
		@board[6] = [:wP,:wP,:wP,:wP,:wP,:wP,:wP,:wP]
		@board[7] = [:wR,:wN,:wB,:wQ,:wK,:wB,:wN,:wR]
	end

	def fill_complex_board
		8.times{@board.push(Array.new(8,nil))}
		@board[0] = [:bK,nil,nil,nil,nil,:bB,nil,nil]
		@board[1] = [nil,nil,nil,nil,nil,:bP,nil,nil]
		@board[2] = [nil,:bP,:wR,nil,:wB,nil,:bN,nil]
		@board[3] = [:wN,nil,:bP,:bR,nil,nil,nil,:wP]
		@board[4] = [nil,nil,nil,nil,:wK,:wQ,nil,:wP]
		@board[5] = [:wR,nil,:bB,:wN,:wP,nil,nil,nil]
		@board[6] = [nil,:wP,:bQ,nil,nil,:wP,nil,nil]
		@board[7] = [nil,nil,nil,nil,nil,:wB,nil,nil]
	end

	def load_file_and_check
		str = IO.read("chess_comples.txt")
		arr1 = str.split("\n") 
			arr1.each do |pair|
				p =pair.split(" ")
				conversion1 p[0],p[1]
			end
	end

	def conversion1 row,column #a3,a4
			@origin = @positions[:"#{row}"] # returns [7,0]
			@destination = @positions[:"#{column}"] # returns [4,0]
			conversion2 @origin,@destination
	end

	def conversion2 coord1,coord2
		@piece_origin =	@board[coord1[0]][coord1[1]] # wR
		piece_destination =	@board[coord2[0]][coord2[1]] # nil

		same_color = check_colors @piece_origin,piece_destination
			if same_color == false && @piece_origin != nil 
					@pieces[:"#{@piece_origin}"].new(@piece_origin[0]).validate_move(@origin,@destination)
			else
					puts "ILLEGAL" #CHECK ORIGIN AND DESTINATION - EMPTY OR SAME COLOR"
			end

	end

	def check_colors piece1,piece2
		if piece1.to_s[0] == piece2.to_s[0]
			true
		else
			false
		end

	end

end

# solution 1 --> using a simple board

	# my_board = Board.new
	# my_board.fill_board
	# my_board.conversion1 "a2","a3"

# solution 2 --> using a complex board loaded from a file

	my_board = Board.new
	my_board.fill_complex_board
	my_board.load_file_and_check


#--------------- TEST ----------------

RSpec.describe "String calculator" do
	before(:each) do
		@pieza = Rook.new(my_board)
	end
	it "returns true if Rook move possible" do
		# expect(@pieza.move_possible?([0,0],[3,0])).to be_truthy
		expect(@pieza.validate_move([0,0],[1,0])).to eq('LEGAL')
	end
end

RSpec.describe "String calculator" do
	before(:each) do
		@pieza = Queen.new(my_board)
	end
	it "returns true if move possible" do
		#expect(@pieza.move_possible?([0,0],[2,1])).to be_truthy
			expect(@pieza.validate_move([0,0],[0,5])).to eq('LEGAL')
	end
end

RSpec.describe "String calculator" do
	before(:each) do
		@pieza = Knigth.new(my_board)
	end
	it "returns true if Knigth move possible" do
		#expect(@pieza.move_possible?([0,0],[2,1])).to be_truthy
				expect(@pieza.validate_move([0,0],[3,0])).to eq('ILLEGAL')
	end
end

RSpec.describe "String calculator" do
	before(:each) do
		@pieza = King.new(my_board)
	end
	it "returns true if King move possible" do
		expect(@pieza.move_possible?([0,0],[1,1])).to be_truthy
				# expect(@pieza.validate_move([0,0],[3,0])).to eq('LEGAL')
	end
end

RSpec.describe "String calculator" do
	before(:each) do
		@pieza = Bishop.new(my_board)
	end
	it "returns true if Bishop move possible" do
		# expect(@pieza.move_possible?([0,0],[3,3])).to be_truthy
				expect(@pieza.validate_move([0,0],[1,0])).to eq('ILLEGAL')
	end
end

RSpec.describe "String calculator" do
	before(:each) do
		@pieza = Pawn.new(my_board)
	end
	it "returns true if Pawn move possible" do
		# expect(@pieza.move_possible?([0,0],[3,0])).to be_truthy
				expect(@pieza.validate_move([0,0],[2,0])).to eq('LEGAL')
	end
end