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
  

  def place_computer_cruiser
    ship = @computer_ships.first
    coordinates = []
    (ship.length).times { coordinates << @computer_board.cells.keys.sample }
    if @computer_board.valid_placement?(ship, coordinates)
      @computer_board.place(ship, coordinates)
    else
      until @computer_board.valid_placement?(ship, coordinates)
        coordinates = []
        (ship.length).times { coordinates << @computer_board.cells.keys.sample }
      end
      @computer_board.place(ship, coordinates)
    end
  end

  def place_computer_submarine
    ship = @computer_ships.last
    coordinates = []
    (ship.length).times { coordinates << @computer_board.cells.keys.sample }
    if @computer_board.valid_placement?(ship, coordinates)
      @computer_board.place(ship, coordinates)
    else
      until @computer_board.valid_placement?(ship, coordinates)
        coordinates = []
        (ship.length).times { coordinates << @computer_board.cells.keys.sample }
      end
      @computer_board.place(ship, coordinates)
    end
  end



  def place_player_ships
    @player_ships.each do |ship|
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
      coordinates = gets.chomp.upcase.chars.each_slice(2).to_a.map(&:join)
      if @player_board.valid_placement?(ship, coordinates)
        @player_board.place(ship, coordinates)
      else
        until @player_board.valid_placement?(ship, coordinates)
          puts "Sorry, those are not valid coordinates. Please try again"
          coordinates = gets.chomp.upcase.chars.each_slice(2).to_a.map(&:join)
        end
        @player_board.place(ship, coordinates)
      end
    end
  end

end