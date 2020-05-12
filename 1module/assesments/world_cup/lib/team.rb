class Team

  attr_reader :country
  attr_accessor :players

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated
    @eliminated = true
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end
  
  def players_by_position(position)
    @players.select { |player| player.position == position }
  end
  
end