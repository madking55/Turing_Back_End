require 'minitest/autorun'
require 'pry'
require_relative 'near_earth_objects'
require_relative 'asteroid'

class AsteroidTest < Minitest::Test
  def test_it_exists
    result = NearEarthObjects.find_neos_by_date('2019-03-30')[0]
    assert_instance_of Asteroid, result
  end

  def test_it_has_attributes
    result = NearEarthObjects.find_neos_by_date('2019-03-30')[0]
    
    assert_equal "3840858", result.id
    assert_equal 61, result.diameter
    assert_equal 911947, result.miss_distance
  end

  def test_it_can_format_data
    result = NearEarthObjects.find_neos_by_date('2019-03-30')[0]

    assert_equal ({name: result.name, diameter: "#{result.diameter} ft", miss_distance: "#{result.miss_distance} miles"}), result.formatted_asteroid_data
  end
end