# good practice rule is to require a library in the file you are actually using it
require 'faraday' 

class GhibliSearch
  def all_films
    get_json("films")
  end

  def get_json(path)
    url = "https://ghibliapi.herokuapp.com/#{path}"
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true) 
  end
end

