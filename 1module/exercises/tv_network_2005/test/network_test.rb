require_relative 'test_helper'
require './lib/network'
require './lib/show'
require './lib/character'
require 'pry'

class NetworkTest < Minitest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
    @mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000}) 
    @baywatch = Show.new("Baywatch", "Gregory Bonann", [@mitch])
    @nbc = Network.new("NBC")  
  end


  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_has_attributes
    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows
  end

  def test_it_adds_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec) 
    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_it_returns_main_characters
    # A character is a main character for the network if their salary is greater than 500_000 and their character name has no lowercase letters.
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec) 

    assert_equal [@kitt], @nbc.main_characters
  end

  def test_it_returns_actors_by_show
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec) 
    expected = {
      @knight_rider => ["David Hasselhoff", "William Daniels"],
      @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
    }
    assert_equal expected, @nbc.actors_by_show
  end

  def test_it_returns_show_by_actor
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@baywatch) 
    @nbc.add_show(@parks_and_rec)
    expected = {
                "David Hasselhoff" => [@knight_rider, @baywatch],  
                "William Daniels" => [@knight_rider],
                "Amy Poehler" => [@parks_and_rec],
                "Nick Offerman" => [@parks_and_rec]
                }
     assert_equal expected, @nbc.shows_by_actor
  end

  def test_it_returns_profilic_actors 
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@baywatch) 
    @nbc.add_show(@parks_and_rec)

    assert_equal ["David Hasselhoff"], @nbc.prolific_actors
  end


end