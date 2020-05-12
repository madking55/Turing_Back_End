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
end