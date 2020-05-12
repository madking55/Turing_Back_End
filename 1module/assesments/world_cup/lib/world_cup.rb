class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_teams
    @teams.select { |team| !team.eliminated? }
  end

  def active_players_by_postion(position)
    active_teams.map { |team| team.players_by_position(position) }.flatten
  end

  def all_players_by_position
    hash = Hash.new([])
    all_positions.each do |position|
      hash[position] = active_players_by_postion(position)
    end
    hash
  end

  def all_positions
    all_players.map { |player| player.position }.flatten
  end

  def all_players
    @teams.map { |team| team.players }.flatten
  end
end