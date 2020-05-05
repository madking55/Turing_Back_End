require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_16_cells
    board = Board.new
    assert_instance_of Hash, board.cells
    assert_equal 16, board.cells.length
    assert board.cells.values.all? { |cell| cell.is_a?(Cell) }
  end

  def test_it_can_validate_cell_coordinates
    board = Board.new
    assert board.vaild_coordinate?("A1")
    assert board.vaild_coordinate?("D4")
    refute board.vaild_coordinate?("A5")
    refute board.vaild_coordinate?("E1")
    refute board.vaild_coordinate?("A22")
  end

  def test_coordinates_and_ship_size_equal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    refute board.coordinates_and_ship_size_equal?(cruiser, ["A1", "A2"])
    refute board.coordinates_and_ship_size_equal?(submarine, ["A2", "A3", "A4"])
  end

  def test_consecutive_coordinates?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    refute board.consecutive_coordinates?(cruiser, ["A1", "A2", "A4"])
    refute board.consecutive_coordinates?(submarine, ["A1", "C1"])
    refute board.consecutive_coordinates?(cruiser, ["A3", "A2", "A1"])
    refute board.consecutive_coordinates?(submarine, ["C1", "B1"])

    assert board.consecutive_coordinates?(cruiser, ["A2", "A3", "A4"])
    assert board.consecutive_coordinates?(submarine, ["A1", "B1"])
    assert board.consecutive_coordinates?(cruiser, ["A3", "B3", "C3"])
  end

  def test_horizontal_consecutive_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    refute board.horizontal_check(cruiser, ["A1", "A2", "A4"])
    assert board.horizontal_check(cruiser, ["A2", "A3", "A4"])
    assert board.horizontal_check(submarine, ["A1", "A2"])
  end

  def test_vertical_consecutive_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    refute board.vertical_check(submarine, ["C1", "B1"])
    assert board.vertical_check(submarine, ["A1", "B1"])
    assert board.vertical_check(cruiser, ["A3", "B3", "C3"])
  end

  def test_coordinates_not_diagonal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    refute board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    refute board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_it_can_validate_ship_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 

    assert board.valid_placement?(submarine, ["A1", "A2"])
    assert board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  
end