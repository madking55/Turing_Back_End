require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_it_has_coordinate
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_it_can_be_empty
    cell = Cell.new("B4")
    assert_nil cell.ship
    assert cell.empty?
  end

  def test_it_places_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
    refute cell.empty?
  end

  def test_it_knows_when_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    refute cell.fired_upon?
    cell.fire_upon
    assert_equal 2, cell.ship.health
    assert cell.fired_upon?
  end

  def test_it_renders_cell_string_representation
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render
    cell_1.fire_upon
    cell_1.render
    assert_equal "M", cell_1.render
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)
    cell_2.fire_upon
    assert_equal "H", cell_2.render
    refute cruiser.sunk?
    cruiser.hit
    cruiser.hit
    assert cruiser.sunk?
    assert_equal "X", cell_2.render
  end

end