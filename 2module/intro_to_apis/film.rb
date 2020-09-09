class Film
  attr_reader :title, :director, :producer, :rotten_tomatoes

  def initialize(film_data)
    @title = film_data[:title]
    @director = film_data[:director]
    @producer = film_data[:producer]
    @rotten_tomatoes = film_data[:rt_score]
  end
end