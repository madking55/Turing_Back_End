require_relative './lib/card'
require_relative './lib/deck'
require_relative './lib/player'
require_relative './lib/turn'
require_relative './lib/game'
require_relative './lib/cards_generator.rb'
require 'pry'

# Create a standard Deck of 52 Cards
game_deck = CardsGenerator.new('cards.txt').cards

# Put card into two Decks (some randomness would be nice here!)
deck1 = Deck.new(game_deck.sample(26))
deck2 = Deck.new(game_deck - deck1.cards)

# Create two players with the Decks
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

# Start the Game
game = Game.new(player1, player2)
game.start
