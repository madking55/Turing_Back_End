require './lib/board'
require './lib/ship'
require './lib/cell'

class Game
  attr_reader :player_board, :computer_board, :cruiser, :submarine

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def main_menu
    p "********** Welcome to BATTLESHIP *********"
    p "***** Enter p to play, or q to quit *****"
    player_input = gets.chomp
    if player_input == 'p'
      setup_game
    elsif player_input == 'g'
      exit
    else
      p "***** Enter p to play, or q to quit *****"
    end
  end
  
  def setup_game
    place_computer_ships
    # place player ships
  end


  def place_computer_ships
    cruiser_coordinates = []
    until computer_board.valid_placement?(cruiser, cruiser_coordinates)
       cruiser_coordinates = computer_board.cells.keys.sample(3) 
    end

    sumbarine_coordinates = []
    until computer_board.valid_placement?(submarine, sumbarine_coordinates)
      sumbarine_coordinates = computer_board.cells.keys.sample(2)
    end
    
    computer_board.place(cruiser, cruiser_coordinates)
    computer_board.place(submarine, sumbarine_coordinates)
  end




end