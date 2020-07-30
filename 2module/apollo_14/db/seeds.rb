# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AstronautMission.destroy_all
Astronaut.destroy_all
Mission.destroy_all

armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
behnken = Astronaut.create!(name: "Bob Behnken", age: 49, job: "Chief")

gemini = Mission.create!(title: "Gemini 7", time_in_space: 40)
apollo = Mission.create!(title: "Apollo 13", time_in_space: 14)
capricorn = Mission.create!(title: "Capricorn 4", time_in_space: 24)

AstronautMission.create!(astronaut_id: armstrong.id, mission_id: gemini.id)
AstronautMission.create!(astronaut_id: armstrong.id, mission_id: apollo.id)
AstronautMission.create!(astronaut_id: armstrong.id, mission_id: capricorn.id)
