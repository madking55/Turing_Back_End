require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'

class VehicleTest <Minitest::Test

  def test_it_exists
    vehicle = Vehicle.new("pickup", true, true)

    assert_instance_of Vehicle, vehicle
  end

  def test_vehicle_knows_if_its_a_car
    vehicle_1 = Vehicle.new("pickup", true, true)
    vehicle_2 = Vehicle.new("car", true, true)

    assert_equal false, vehicle_1.car?
    assert vehicle_2.car?
  end

  def test_vehicle_knows_its_a_tractor
    vehicle_1 = Vehicle.new("tractor", true, true)
    vehicle_2 = Vehicle.new("car", true, true)

    assert_equal false, vehicle_2.tractor?
    assert vehicle_1.tractor?
  end

  def test_vehicle_knows_its_a_pickup
    vehicle_1 = Vehicle.new("pickup", true, true)
    vehicle_2 = Vehicle.new("car", true, true)

    assert_equal false, vehicle_2.pickup?
    assert vehicle_1.pickup?
  end

  def test_vehicle_returns_boolean_for_for_wheel_drive
    vehicle = Vehicle.new("pickup", true, true)
    vehicle_2 = Vehicle.new("car", false, true)

    assert vehicle.four_wheel_drive?
    assert_equal false, vehicle_2.four_wheel_drive?
  end

  def test_vehicle_returns_boolean_for_big_back_wheels
    vehicle = Vehicle.new("pickup", true, true)
    vehicle_2 = Vehicle.new("car", false, false)

    assert vehicle.big_back_wheels?
    assert_equal false, vehicle_2.big_back_wheels?
  end

end
