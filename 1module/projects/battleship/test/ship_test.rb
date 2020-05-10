require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new('Cruiser', 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_name_and_length
    cruiser = Ship.new('Cruiser', 3)

    assert_equal 'Cruiser', cruiser.name
    assert_equal 3, cruiser.length
  end

  def test_it_starts_with_health_equal_to_length
    cruiser = Ship.new('Cruiser', 3)

    assert_equal cruiser.length, cruiser.health
  end

  def test_it_loses_health_when_hit
    cruiser = Ship.new('Cruiser', 3)
    cruiser.hit
    assert_equal 2, cruiser.health
  end

  def test_it_sunks_when_no_health
    cruiser = Ship.new('Cruiser', 3)
    refute cruiser.sunk?
    cruiser.hit
    refute cruiser.sunk?
    cruiser.hit
    refute cruiser.sunk?
    cruiser.hit
    assert cruiser.sunk?
  end
end