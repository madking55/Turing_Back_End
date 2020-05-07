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
  end

  def it_places_computer_ships
    game = Game.new
    expected_board = "  1 2 3 4 \n" +
    "A . . . . \n" +
    "B . . . . \n" +
    "C . . . . \n" +
    "D . . . . \n"

    assert_equal expected_board, game.computer_board

    computer_board.place_computer_ships
    expected_board = computer_board.render(true)
    assert_equal 5, expected_board.cells.count { |cell| cell.render == "S"}
  end




  
end