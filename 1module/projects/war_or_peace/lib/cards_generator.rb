class CardsGenerator
  attr_reader :filename, :game_deck

  def initialize(filename)
    @filename = filename
    @game_deck = []
  end


  def import_from_file
    file = File.open(filename).each { |card| @game_deck << card }
    file.close
  end

  def transform_to_card
    cards = []
    @game_deck.each do |line|
      # line => Card.new(suit, value, rank)
      transformed_line = line.strip.split(', ') # => ["Ace", "Club", "14"]
      suit = transformed_line[1].downcase.to_sym
      value = transformed_line[0]
      rank = transformed_line[2].to_i
      card = Card.new(suit, value, rank)
      cards << card
    end
    cards
  end

  def cards
    import_from_file
    transform_to_card
  end

  # def transform_line_to_card
  #     # line => Card.new(suit, value, rank)
  #     transformed_line = line.strip.split(', ') # => ["Ace", "Club", "14"]
  #     Card.new(transformed_line[1].downcase.to_sym, transformed_line[0], transformed_line[2].to_i)
  # end

  # def cards
  #   import_from_file
  #   @game_deck.map(&:transform_line_to_card)
  # end
end
