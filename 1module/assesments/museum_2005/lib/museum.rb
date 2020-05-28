class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
   @exhibits.select { |exhibit| patron.interests.include?(exhibit.name)}
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    hash = Hash.new 
    @exhibits.each do |ex| 
      hash[ex] = [] 
      @patrons.each do |patron|
        hash[ex] << patron if patron.interests.include?(ex.name)
      end
    end
    hash
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest[exhibit].select { |patron| exhibit.cost > patron.spending_money }
  end

  def draw_lottery_winner(exhibit)
    winner = ticket_lottery_contestants(exhibit).sample
    winner.name unless winner.nil?
  end

  def announce_lottery_winner(exhibit)
    if draw_lottery_winner(exhibit).nil?
      "No winners for this lottery"
    else
      "#{draw_lottery_winner(exhibit)} has won the #{exhibit.name} exhibit lottery"
    end
  end
end