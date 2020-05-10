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

    refute board.valid_placement?(cruiser, ["A1", "A2"])
    refute board.valid_placement?(submarine, ["A2", "A3", "A4"])
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
    refute board.horizontal_check(cruiser, ["A3", "A4", "B1"])
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
    refute board.vertical_check(cruiser, ["B3", "D3", "A3"])
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

    assert board.valid_placement?(submarine, ["C4", "D4"])
    assert board.valid_placement?(submarine, ["A1", "A2"])
    refute board.vertical_check(cruiser, ["B3", "C3", "A3"])
    assert board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_it_can_place_ship_in_cells
    board = Board.new
    cruiser = Ship.new("Cruiser", 3) 
    board.place(cruiser, ["A1", "A2", "A3"]) 
    cell_1 = board.cells["A1"] 
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"] 
    cell_4 = board.cells["B1"]

    assert_instance_of Ship, cell_1.ship
    assert cell_1.ship == cell_2.ship
    assert cell_4.empty?
    assert_equal 3, board.cells.count { |key, value| board.cells[key].empty? == false }
  end

  def test_ships_dont_overlap
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)  
    refute board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_it_can_render_initial_board_state
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2) 
    board.place(cruiser, ["A1", "A2", "A3"]) 
    board.place(submarine, ["C4", "D4"])
    empty_board = "  1 2 3 4 \n" +
                  "A . . . . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n"
    assert_equal empty_board, board.render
    
    board_showing_ships = "  1 2 3 4 \n" +
                          "A S S S . \n" +
                          "B . . . . \n" +
                          "C . . . S \n" +
                          "D . . . S \n"

    # assert_equal board_showing_ships, board.render(true)
    cell = "A1"
    assert_equal "S", board.cells[cell].render(true)
  end
  
end