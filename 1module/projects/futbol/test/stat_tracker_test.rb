require './test/test_helper'
require './lib/stat_tracker'

class StatTrackerTest < Minitest::Test 

  def setup
    @stat_tracker = StatTracker.from_csv({
      games: "./test/fixtures/short_games.csv",
      teams: "./data/teams.csv",
      game_teams: "./test/fixtures/short_games_teams.csv"
    })
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_it_has_attributes
    assert_equal "./test/fixtures/short_games.csv", @stat_tracker.games_path
    assert_equal "./data/teams.csv", @stat_tracker.teams_path
    assert_equal "./test/fixtures/short_games_teams.csv", @stat_tracker.game_teams_path
  end
end