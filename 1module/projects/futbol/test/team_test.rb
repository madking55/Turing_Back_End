require './test/test_helper'
require './lib/team'

class TeamTest < Minitest::Test
  
  def setup
    file_path = "./data/teams.csv"
    @teams = Team.from_csv(file_path)

    @team = Team.new({
      team_id: 1,
      franchiseid: 23, 
      teamname: "Atlanta United",
      abbreviation: "ATL",
      stadium: "Mercedes-Benz Stadium",
      link: "/api/v1/teams/1"
    })
  end

  def test_it_exists
    assert_instance_of Team, @team
    assert_instance_of Team, @teams.first
  end

  def test_it_returns_all_teams
    assert_instance_of Array, Team.all 
    assert_instance_of Team, Team.all.first 
    assert_equal 32, Team.all.length
  end

  def test_it_has_attributes
    assert_equal 1, @team.team_id
    assert_equal 23, @team.franchise_id
    assert_equal "Atlanta United", @team.team_name
    assert_equal "ATL", @team.abbreviation
    assert_equal "Mercedes-Benz Stadium", @team.stadium
    assert_equal "/api/v1/teams/1", @team.link
  end

end