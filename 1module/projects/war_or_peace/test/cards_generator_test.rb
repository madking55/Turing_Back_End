require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/game'
require './lib/player'
require './lib/cards_generator'
require 'pry'

class CardsGeneratorTest < Minitest::Test

  def test_it_exists
    filename = 'cards.txt'
    cards = CardsGenerator.new(filename).cards
    assert_instance_of CardsGenerator, cards
    
  end
  
end