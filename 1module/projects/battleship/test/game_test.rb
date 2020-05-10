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
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    computer_ships = [cruiser, submarine]
    game.place_computer_ships

    assert_equal 5, game.computer_board.cells.count { |key, value| game.computer_board.cells[key].empty? == false}
    expected_board = game.computer_board.render(true)
    assert expected_board.include?("S")
  end

  def test_it_places_player_ships
    game = Game.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_ships = [cruiser, submarine]
    game.place_player_ships

    assert_equal 5, game.player_board.cells.count { |key, value| game.player_board.cells[key].empty? == false }
    expected_board = game.player_board.render(true)
    assert expected_board.include?("S")
  end

  def test_player_can_take_shot
    game = Game.new
    @computer_board = Board.new
    game.place_computer_ships

    assert_instance_of String, game.player_takes_shot
  end

  def test_computer_can_take_shot
    game = Game.new
    @player_board = Board.new
    game.place_player_ships

    assert_instance_of String, game.computer_takes_shot
  end

  def it_can_end_game
    game = Game.new
    @player_board = Board.new
    @computer_board = Board.new
    @winner = nil
    game.player_board.place(Ship.new("Cruiser", 3), ["A1", "A2", "A3"])
    game.player_board.place(Ship.new("Submarine", 2), ["B1", "B2"])
    game.player_board.cells["A1"].fire_upon
    game.player_board.cells["A2"].fire_upon
    game.player_board.cells["A3"].fire_upon
    game.player_board.cells["B1"].fire_upon
    game.player_board.cells["B2"].fire_upon

    assert_equal "computer", game.winner
  end

end