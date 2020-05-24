require_relative 'test_helper'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_attributes
    assert_equal "1406 BE", @reunion.name
    assert_equal [], @reunion.activities
  end
  
  def test_it_adds_activities
    assert_equal [], @reunion.activities
    @reunion.add_activity(@activity_1)
    assert_equal [@activity_1], @reunion.activities
  end
end