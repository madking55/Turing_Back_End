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

  def test_it_places_computer_submarine
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    computer_ships = [cruiser, submarine]
    game.place_computer_submarine

    assert_equal 2, game.computer_board.cells.count { |key, value| game.computer_board.cells[key].empty? == false}
    expected_board = game.computer_board.render(true)
    assert expected_board.include?("S")
  end

  def test_it_places_computer_cruiser
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    computer_ships = [cruiser, submarine]
    game.place_computer_cruiser

    assert_equal 3, game.computer_board.cells.count { |key, value| game.computer_board.cells[key].empty? == false}
    expected_board = game.computer_board.render(true)
    assert expected_board.include?("S")
  end
  

  def test_it_places_player_ships
    skip
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_ships = [cruiser, submarine]
    game.place_player_ships

    assert_equal 5, game.player_board.cells.count { |key, value| game.player_board.cells[key].empty? == false }
    expected_board = game.player_board.render(true)
    assert expected_board.include?("S")
  end
end