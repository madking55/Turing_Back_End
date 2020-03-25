require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  def test_player_starts_with_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal 'Clarisa', player.name
    assert_equal deck, player.deck
  end
  
  def test_player_lost_when_deck_empty
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal deck, player.deck

    3.times { player.deck.remove_card }
    assert_equal [], player.deck.cards
    assert player.has_lost?
  end
end