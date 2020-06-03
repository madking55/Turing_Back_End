require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require 'pry'

class TeamTest < Minitest::Test 

  def test_it_exists
    team = Team.new("France")
    assert_instance_of Team, team
  end

  def test_it_has_attributes
    team = Team.new("France")
    assert_equal "France", team.country
  end

  def test_it_can_be_eliminated
    team = Team.new("France")
    refute team.eliminated?
    team.eliminated
    assert team.eliminated?
  end

  def test_it_can_add_players
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    assert team.players.empty?
    team.add_player(mbappe)
    team.add_player(pogba)

    assert team.players.include?(mbappe)
    assert team.players.include?(pogba)
  end

  def test_it_can_display_players_by_postion
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.players = [mbappe, pogba]

    assert_equal [mbappe], team.players_by_position("forward")
    assert_equal [pogba], team.players_by_position("midfielder")
    assert_equal [], team.players_by_position("defender")
  end

  
end
