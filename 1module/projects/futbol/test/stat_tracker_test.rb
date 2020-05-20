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
end