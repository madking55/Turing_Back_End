require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/vehicle_analysis'
require 'stringio'
require 'o_stream_catcher'

class VehicleTest <Minitest::Test

  def test_it_exists
    analysis = VehicleAnalysis.new

    assert_instance_of VehicleAnalysis, analysis
  end

  def test_it_knows_that_pickup_has_four_wheels
    vehicle_1 = Vehicle.new("pickup", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("Vehicle has four wheels")
  end

  def test_it_knows_that_car_has_four_wheels
    vehicle_1 = Vehicle.new("car", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("Vehicle has four wheels")
  end

  def test_it_knows_that_tractor_has_four_wheels
    vehicle_1 = Vehicle.new("tractor", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("Vehicle has four wheels")
  end

  def test_it_does_not_show_big_back_wheels_for_car_when_true
    vehicle_1 = Vehicle.new("car", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert_equal false, stdout.include?("with big wheels in the back")
  end

  def test_it_does_not_show_big_back_wheels_for_car_when_false
    vehicle_1 = Vehicle.new("car", true, false)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert_equal false, stdout.include?("with big wheels in the back")
  end

  def test_cars_have_either_four_or_two_wheel_drive
    vehicle_1 = Vehicle.new("car", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("with four wheel drive")
    assert_equal false, stdout.include?("with two wheel drive")
  end

  def test_tractors_dont_show_four_or_two_wheel_drive
    vehicle_1 = Vehicle.new("tractor", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert_equal false, stdout.include?("with four wheel drive")
    assert_equal false, stdout.include?("with two wheel drive")
  end

  def test_tractors_show_big_wheels_analysis_if_true
    vehicle_1 = Vehicle.new("tractor", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("with big wheels in the back")
  end

  def test_tractors_dont_show_big_wheels_analysis_if_false
    vehicle_1 = Vehicle.new("tractor", true, false)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert_equal false, stdout.include?("with big wheels in the back")
  end

  def test_pickup_has_four_wheel_drive
    vehicle_1 = Vehicle.new("pickup", true, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("with four wheel drive")
    assert_equal false, stdout.include?("with two wheel drive")
  end

  def test_pickup_has_two_wheel_drive
    vehicle_1 = Vehicle.new("pickup", false, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("with two wheel drive")
    assert_equal false, stdout.include?("with four wheel drive")
  end

  def test_pickup_can_show_big_back_wheels_when_true
    vehicle_1 = Vehicle.new("pickup", false, true)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert stdout.include?("with big wheels in the back")
  end

  def test_pickup_doesnt_can_show_big_back_wheels_when_false
    vehicle_1 = Vehicle.new("pickup", true, false)

    result, stdout, stderr = OStreamCatcher.catch do
      VehicleAnalysis.new.analyze(vehicle_1)
    end

    assert_equal false, stdout.include?("with big wheels in the back")
  end

end
