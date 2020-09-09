class Person
  attr_reader :name

  def initialize(people_data)
    @name = people_data[:name]
    @film_urls = people_data[:films]
  end

  def film_titles
    film_ids = @film_urls.map do |film_url|
      film_url.gsub("https://ghibliapi.herokuapp.com/films/", '')
    end
    
    film_ids.map do |film_id|
      attributes = GhibliSearch.new.film(film_id)
      Film.new(attributes)
    end
  end
end