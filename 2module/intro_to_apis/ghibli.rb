require 'json'
require 'pry'
require './film'
require './person'
require './ghibli_search'

# Use the studio Ghibli Films url = API to find info on each film
# For each film print its name, director, producer and Rotten Tomatoes score

film_data = GhibliSearch.new.all_films

films = film_data.map do |film_attributes|
  Film.new(film_attributes)
end

films.each do |film|
  puts film.title
  puts "Directed by #{film.director}"
  puts "Produced by #{film.producer}"
  puts "Rotten Tomatoes Score: #{film.rotten_tomatoes}"
  puts "____________________________________________"
end

people_data = GhibliSearch.new.all_people

people = people_data.map do |person_attributes|
  Person.new(person_attributes)
end

people.each do |person|
  puts person.name
  puts "Films:"
  person.film_titles.each do |film|
    puts film.title
  end
  puts "____________________________________________"
end