class Network
  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    characters = @shows.flat_map(&:characters)
    characters.select { |char| char.salary > 500_000 && char.name == char.name.upcase}
  end

  def actors_by_show
    actors_by_show = {}
    @shows.each do |show|
     actors_by_show[show] = show.actors
    end
    actors_by_show
  end
  
end