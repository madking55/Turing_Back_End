require_relative 'test_helper'
require './lib/reunion'
require './lib/activity'
require 'pry'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
  end
  
  def setup_two_activities
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)
  end

  def setup_complex_reunion
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    @reunion.add_activity(activity_1)


    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)

    @reunion.add_activity(@activity_2)

    activity_3 = Activity.new("Bowling")
    activity_3.add_participant("Maria", 0)
    activity_3.add_participant("Luther", 0)
    activity_3.add_participant("Louis", 30)

    @reunion.add_activity(activity_3)

    @activity_4 = Activity.new("Jet Skiing")
    @activity_4.add_participant("Maria", 0)
    @activity_4.add_participant("Luther", 0)
    @activity_4.add_participant("Louis", 40)
    @activity_4.add_participant("Nemo", 40)

    @reunion.add_activity(@activity_4)
end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_attributes
    assert_equal "1406 BE", @reunion.name
    assert_equal [], @reunion.activities
  end
  
  def test_it_adds_activities
    activity_1 = Activity.new("brunch")
    activity_2 = Activity.new("lunch")
    @reunion.add_activity(activity_1)
    @reunion.add_activity(activity_2)
    assert_equal [activity_1, activity_2], @reunion.activities
  end

  def test_total_cost_sums_all_costs_of_all_activities
    setup_two_activities
    assert_equal 180, @reunion.total_cost
  end

  def test_it_returns_breakout_costs
    setup_two_activities
    assert_equal ({"Maria" => -10, "Luther" => -30, "Louis" => 40}), @reunion.breakout
  end

  def test_it_returns_summary
    setup_two_activities
    assert_equal "Maria: -10\nLuther: -30\nLouis: 40", @reunion.summary
  end

  def test_it_returns_all_participants
    setup_complex_reunion
    assert_equal ["Maria", "Luther", "Louis", "Nemo"], @reunion.all_participants
  end

  def test_it_returns_payees
    setup_complex_reunion
    assert_equal ["Louis", "Nemo"], @reunion.get_payees(@activity_4, 'Maria')
    assert_equal ["Louis"], @reunion.get_payees(@activity_2, 'Luther')
  end

  def test_it_returns_breakout_for_paricipant
    setup_complex_reunion

    expected = [
      {
        activity: "Brunch",
        payees: ["Luther"],
        amount: 10
      },
      {
        activity: "Drinks",
        payees: ["Louis"],
        amount: -20
      },
      {
        activity: "Bowling",
        payees: ["Louis"],
        amount: 10
      },
      {
        activity: "Jet Skiing",
        payees: ["Louis", "Nemo"],
        amount: 10
      }
    ]
    assert_equal expected, @reunion.detailed_breakout_for_participant('Maria')
  end

  def test_it_returns_detailed_breakout
    setup_complex_reunion

    expected = {
      "Maria" => [
        {
          activity: "Brunch",
          payees: ["Luther"],
          amount: 10
        },
        {
          activity: "Drinks",
          payees: ["Louis"],
          amount: -20
        },
        {
          activity: "Bowling",
          payees: ["Louis"],
          amount: 10
        },
        {
          activity: "Jet Skiing",
          payees: ["Louis", "Nemo"],
          amount: 10
        }
      ],
      "Luther" => [
        {
          activity: "Brunch",
          payees: ["Maria"],
          amount: -10
        },
        {
          activity: "Drinks",
          payees: ["Louis"],
          amount: -20
        },
        {
          activity: "Bowling",
          payees: ["Louis"],
          amount: 10
        },
        {
          activity: "Jet Skiing",
          payees: ["Louis", "Nemo"],
          amount: 10
        }
      ],
      "Louis" => [
        {
          activity: "Drinks",
          payees: ["Maria", "Luther"],
          amount: 20
        },
        {
          activity: "Bowling",
          payees: ["Maria", "Luther"],
          amount: -10
        },
        {
          activity: "Jet Skiing",
          payees: ["Maria", "Luther"],
          amount: -10
        }
      ],
      "Nemo" => [
        {
          activity: "Jet Skiing",
          payees: ["Maria", "Luther"],
          amount: -10
        }
      ]
    }

    assert_equal expected, @reunion.detailed_breakout
  end
  
end