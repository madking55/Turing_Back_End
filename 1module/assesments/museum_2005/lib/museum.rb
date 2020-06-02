class Museum
  attr_reader :name, :exhibits, :patrons, :patrons_of_exhibits
  attr_accessor :revenue

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
    @patrons_of_exhibits = Hash.new { |hash, key| hash[key] = [] }
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
   @exhibits.select { |exhibit| patron.interests.include?(exhibit.name)}
  end

  def admit(patron)
    @patrons << patron
    attend_exhibits(patron)
  end

  def attend_exhibits(patron)
    attended_exhibits = []
    sorted = recommend_exhibits(patron).sort_by { |exhibit| exhibit.cost }.reverse
    sorted.each do |exhibit|
      if patron.spending_money >= exhibit.cost
        attended_exhibits << exhibit
        patron.spending_money -= exhibit.cost 
        @revenue += exhibit.cost
      end
    end
    attended_exhibits.each do |exhibit|
      patrons_of_exhibits[exhibit] << patron
    end
  end


  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.each do |exhibit| 
      @patrons.each do |patron|
        patrons_by_exhibit[exhibit] = exhibit.patrons(@patrons)
      end
    end
    patrons_by_exhibit
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