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
    cards_generator = CardsGenerator.new('cards.txt')
    assert_instance_of CardsGenerator, cards_generator
  end

  def test_it_imports_from_file
    cards_generator = CardsGenerator.new('cards.txt')
    assert_equal [], cards_generator.game_deck

    cards_generator.import_from_file
    assert_equal 52, cards_generator.game_deck.size
  end

  def test_it_return_array_of_cards
    cards_generator = CardsGenerator.new('cards.txt')

    assert cards_generator.cards.all?(Card)
  end
end