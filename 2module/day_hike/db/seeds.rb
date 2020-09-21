# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Trail.destroy_all
Trip.destroy_all
TripTrail.destroy_all

trip_1 = Trip.create(name: 'Trip One')
trip_2 = Trip.create(name: 'Trip Two')

trail_1 = Trail.create(name: "Zen Garden", address: "123 Zen Hike Trail", length: 2)
trail_2 = Trail.create(name: "Angel Shore", address: "123 Angel Hike Trail", length: 3)
trail_3 = Trail.create(name: "Sunset Valley", address: "123 Sunset Hike Trail", length: 4)

TripTrail.create!(trip: trip_1, trail: trail_1)
TripTrail.create!(trip: trip_1, trail: trail_2)