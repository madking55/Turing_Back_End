# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Contestant.destroy_all
Bachelorette.destroy_all

@bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
@bachelorette_2 = Bachelorette.create!(name: "Suzie Q", season_number: 11, season_description: "Less dramatic than season 15!")
@contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
@contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
@contestant_3 = @bachelorette_2.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")
@contestant_4 = @bachelorette_1.contestants.create!(name: "Mr Colorado", age: 36, hometown: "New York, NY")
@contestant_5 = @bachelorette_1.contestants.create!(name: "Mr California", age: 46, hometown: "Los Angeles, CA")
@outing_1 = Outing.create!(name: "Kickball", location: "Marfa, TX", date: Date.new(2020,10,28))
@outing_2 = Outing.create!(name: "Hot Springs", location: "Idaho Springs, CO", date: Date.new(2020,10,26))
ContestantOuting.create!(contestant_id: @contestant_1.id, outing_id: @outing_1.id)
ContestantOuting.create!(contestant_id: @contestant_2.id, outing_id: @outing_1.id)
ContestantOuting.create!(contestant_id: @contestant_3.id, outing_id: @outing_1.id)