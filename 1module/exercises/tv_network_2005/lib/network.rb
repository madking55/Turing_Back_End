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
    @shows.each { |show| actors_by_show[show] = show.actors }
    actors_by_show
  end

  def shows_by_actor
   shows_by_actor = {}
   all_actors.each do |actor|
    shows_by_actor[actor] = @shows.select { |show| show.actors.include?(actor) }
   end
   shows_by_actor
  end

  def all_actors
   @shows.flat_map(&:actors).uniq
  end

  def prolific_actors
    shows_by_actor.keys.select { |actor| shows_by_actor[actor].count > 1 }
  end
  
end