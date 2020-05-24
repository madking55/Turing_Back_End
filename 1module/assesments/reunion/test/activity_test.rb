require_relative 'test_helper'
require './lib/activity'

class ActivityTest < Minitest::Test
  
  def setup
    @activity = Activity.new("Brunch")
  end
  
  def test_it_exists
    assert_instance_of Activity, @activity
  end

  def test_it_has_attributes
    assert_equal "Brunch", @activity.name
  end

  def test_it_adds_participants
    assert_equal ({}), @activity.participants
    @activity.add_participant("Maria", 20)
    assert_equal ({"Maria" =>  20}), @activity.participants
    @activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 20, "Luther" => 40}), @activity.participants
  end

  def test_it_returns_total_cost
    @activity.add_participant("Maria", 20)
    assert_equal 20, @activity.total_cost
    @activity.add_participant("Luther", 40)
    assert_equal 60, @activity.total_cost
  end
end