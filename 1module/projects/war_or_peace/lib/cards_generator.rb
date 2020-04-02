class CardsGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    game_deck = []
    # card = Card.new(suit, value, rank)
    file = File.open(filename).each { |card| game_deck << card }
    file.close
    end
  end
end

# p CardsGenerator.new('cards.txt').cards