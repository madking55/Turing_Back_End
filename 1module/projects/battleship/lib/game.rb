require './lib/board'
require './lib/ship'
require './lib/cell'


class Game
  attr_reader :cruiser, :submarine, :player_board, :computer_board, :computer_ships, :player_ships

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer_ships = [cruiser, submarine]
    @player_ships = [cruiser, submarine]
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
    # place computer ships 
    # place player ships
  end
  

  def place_computer_ship
    ship = @computer_ships.last
    # coordinates = ["A1", "B1", "C1"]
    # coordinates = ["A1", "C2", "C3"]
    # coordinates = @computer_board.cells.keys[0..2]
    coordinates = []
    loop do
      (ship.length).times { coordinates << @computer_board.cells.keys.sample }
      break if @computer_board.valid_placement?(ship, coordinates)
    end
    @computer_board.place(ship, coordinates)
  end

  def place_player_ship
    ship = @player_ships.last
    puts "Enter the squares for the Submarine (2 spaces):"
    coordinates = gets.chomp.upcase.chars.each_slice(2).to_a.map(&:join)
    if @player_board.valid_placement?(ship, coordinates)
      @player_board.place(ship, coordinates)
    # else
    #   "Sorry, those are not valid coordinates. Please try again"
    # until @player_board.valid_placement?(ship, coordinates)
    #   coordinates = gets.chomp.upcase.chars.each_slice(2).to_a.map(&:join)
    end
  end

end