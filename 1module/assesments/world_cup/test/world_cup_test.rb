require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'pry'

class WorldCupTest < Minitest::Test 

  def test_it_exists
    france = Team.new("France")  
    croatia = Team.new("Croatia") 
    teams = [france, croatia]
    world_cup = WorldCup.new(2018, teams)
    
    assert_instance_of WorldCup, world_cup
  end

  def test_it_has_attributes
    france = Team.new("France")  
    croatia = Team.new("Croatia") 
    teams = [france, croatia]
    world_cup = WorldCup.new(2018, teams)

    assert_equal 2018, world_cup.year
    assert_equal teams, world_cup.teams
  end

  def test_it_displays_active_players_by_position
    france = Team.new("France") 
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
    france.add_player(mbappe)
    france.add_player(pogba) 
    croatia = Team.new("Croatia") 
    modric = Player.new({name: "Luka Modric", position: "midfielder"}) 
    vida = Player.new({name: "Domagoj Vida", position: "defender"})  
    croatia.add_player(modric)  
    croatia.add_player(vida)
    teams = [france, croatia]
    world_cup = WorldCup.new(2018, teams)

    assert_equal [pogba, modric], world_cup.active_players_by_postion("midfielder")
    croatia.eliminated 
    assert_equal [pogba], world_cup.active_players_by_postion("midfielder")
  end

  def test_it_displayes_all_players_by_position
    france = Team.new("France") 
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
    france.add_player(mbappe)
    france.add_player(pogba) 
    croatia = Team.new("Croatia") 
    modric = Player.new({name: "Luka Modric", position: "midfielder"}) 
    vida = Player.new({name: "Domagoj Vida", position: "defender"})  
    croatia.add_player(modric)  
    croatia.add_player(vida)
    teams = [france, croatia]
    world_cup = WorldCup.new(2018, teams)

    expected = { "forward" => [mbappe], "midfielder" => [pogba, modric], "defender" => [vida] }
    assert_equal expected, world_cup.all_players_by_position
  end
end