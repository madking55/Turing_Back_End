require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_attributes
    game = Game.new
    assert_instance_of Board, game.player_board
    assert_instance_of Board, game.computer_board
    assert_instance_of Ship, game.cruiser
    assert_instance_of Ship, game.submarine
    assert_equal 2, game.computer_ships.length
    assert_equal 2, game.player_ships.length
  end

  def test_it_places_computer_ships
    skip
    game = Game.new

    expected_board = "  1 2 3 4 \n" +
    "A . . . . \n" +
    "B . . . . \n" +
    "C . . . . \n" +
    "D . . . . \n"

    assert_equal expected_board, game.computer_board.render
    # binding.pry
    game.place_computer_ships
    expected_board = game.computer_board.render(true)
    assert_equal 3, expected_board.cells.count { |cell| cell.render == "S"}
  end

  def test_it_places_computer_ship
    skip
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    computer_ships = [cruiser, submarine]
    assert_equal submarine, computer_ships.last
    assert game.place_computer_ship
  end
  

  def test_it_places_player_ships
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_ships = [cruiser, submarine]
    assert_equal submarine, player_ships.last

    game.place_player_ship
    assert_equal 2, game.player_board.cells.count { |key, value| game.player_board.cells[key].empty? == false }
    expected_board = game.player_board.render(true)
    assert expected_board.include?("S")
    
  end
end