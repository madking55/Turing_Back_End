require './lib/board'
require './lib/ship'
require './lib/cell'


class Game
  attr_reader :cruiser, :submarine, :player_board, :computer_board, :computer_ships, :player_ships
  attr_accessor :winner

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer_ships = [cruiser, submarine]
    @player_ships = [cruiser, submarine]
    @winner = nil
  end

  def main_menu
    p "********** Welcome to BATTLESHIP *********"
    p "***** Enter p to play, or q to quit *****"
    player_input = gets.chomp
    if player_input == 'p'
      play_game
    elsif player_input == 'g'
      exit
    else
      p "***** Enter p to play, or q to quit *****"
    end
  end
  
  def play_game
    place_computer_ships 
    place_player_ships
    take_turn
  end  

  def place_computer_ships
    computer_ships.each do |ship|
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

  def take_turn
    display_computer_board
    display_player_board
    player_takes_shot  
    display_player_shot_result
    computer_takes_shot
    display_computer_shot_result
    check_end_of_game
  end

  def check_end_of_game
    if @player_ships.all?(&:sunk?)
      @winner = "computer"
      end_game
    elsif @computer_ships.all?(&:sunk?)
      @winner = "player"
      end_game
    else
      take_turn
    end
  
  end

  def end_game
    if @winner == "computer"
      p "Game over, I won! Better luck next time."
      main_menu
    else @winner == "player"
      p "Game over, you won!"
      main_menu
    end
  end

  def display_computer_board
    puts "======COMPUTER BOARD======"
    computer_board.render(true)
  end

  def display_player_board
    puts "======PLAYER BOARD======"
    player_board.render(true)
  end

  def player_takes_shot
    puts "Enter the coordinate for your shot:"
    shot = gets.chomp.upcase
    if @computer_board.vaild_coordinate?(shot) 
      cell = @computer_board.cells[shot]
      cell.fire_upon
      cell.render(true)
    else
      until @computer_board.vaild_coordinate?(shot) 
        puts "Invalid shot! Please enter a valid coordinate:"
        shot = gets.chomp.upcase
      end
      cell = @computer_board.cells[shot]
      cell.fire_upon
      cell.render(true)
    end
  end

  def display_player_shot_result
    "Your shot was a miss" if player_takes_shot == "M"
    "You hit a ship" if player_takes_shot == "H"
    "You sunk a ship" if player_takes_shot == "X"
  end
    
  def computer_takes_shot
    shot = @player_board.cells.keys.sample
    if @player_board.cells[shot].fired_upon?
      shot = @player_board.cells.keys.sample until @player_board.cells[shot].fired_upon? == false
      cell = @player_board.cells[shot]
      cell.fire_upon
      cell.render(true)
    else
      cell = @player_board.cells[shot]
      cell.fire_upon
      cell.render(true)
    end
  end

  def display_computer_shot_result
    "Computer shot was a miss" if computer_takes_shot == "M"
    "Computer hit a ship" if computer_takes_shot == "H"
    "Computer sunk a ship" if computer_takes_shot == "X"
  end
end