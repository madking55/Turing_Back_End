class CardsGenerator
  attr_reader :filename, :game_deck

  def initialize(filename)
    @filename = filename
    @game_deck = []
  end

  def import_from_file
    file = File.open(filename).each { |line| @game_deck << line }
    file.close
  end

  # line => Card.new(suit, value, rank)
  def transform_line_to_card(line)
    # => ["Ace", "Club", "14"]
    suit, value, rank = line.strip.split(', ')
    Card.new(value.downcase.to_sym, suit, rank.to_i)
  end

  def cards
    import_from_file
    @game_deck.map { |line| transform_line_to_card(line) }
  end
end

