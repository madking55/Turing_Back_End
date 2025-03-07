require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/player'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test
  def test_it_has_two_players_and_turns_count
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    deck1 = Deck.new([card1, card2])
    deck2 = Deck.new([card3, card4])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    game = Game.new(player1, player2)

    assert_instance_of Game, game
    assert_equal 0, game.turns_count
    assert_equal player1, game.player1
    assert_equal player2, game.player2
  end

  def test_it_takes_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    game = Game.new(player1, player2)

    assert_equal 0, game.turns_count

    game.take_turn

    assert_equal 1, game.turns_count
  end
  
  def test_it_ends_game
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    game = Game.new(player1, player2)

    assert_equal '---- DRAW ----', game.end_game
  end
end
