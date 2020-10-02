require 'rails_helper'

RSpec.describe 'Flights Show Page' do

  before :each do
    @delta = Airline.create!(name: "Delta")
    @flight_1 = @delta.flights.create!(number: 1, date: "08/03/2020", time: "5:00 PM", departure_city: "Denver", arrival_city: "Boston")
    @flight_2 = @delta.flights.create!(number: 2, date: "08/04/2020", time: "7:00 AM", departure_city: "Denver", arrival_city: "New York")
    @jim = Passenger.create!(name: "Jim Halpert", age: 30)
    @pam = Passenger.create!(name: "Pam Beesly", age: 28)
    @stanley = Passenger.create!(name: "Stanley Hudson", age: 45)
    @john = Passenger.create!(name: "John Doe", age: 10)
    @sally = Passenger.create!(name: "Sally Doe", age: 5)
    @michael = Passenger.create!(name: "Michael Scott", age: 43)
    PassengerFlight.create!(flight: @flight_1, passenger: @jim)
    PassengerFlight.create!(flight: @flight_1, passenger: @pam)
    PassengerFlight.create!(flight: @flight_1, passenger: @stanley)
    PassengerFlight.create!(flight: @flight_1, passenger: @john)
    PassengerFlight.create!(flight: @flight_1, passenger: @sally)
    PassengerFlight.create!(flight: @flight_2, passenger: @michael)

    visit flight_path(@flight_1.id)
    
  end
  
  it 'shows all info for this flight (number, date, time, departure and arrival city' do
    expect(page).to have_content("Flight Number: #{@flight_1.number}")
    expect(page).to_not have_content("Flight Number: #{@flight_2.number}")
    expect(page).to have_content(@flight_1.date)
    expect(page).to have_content(@flight_1.time)
    expect(page).to have_content(@flight_1.departure_city)
    expect(page).to have_content(@flight_1.arrival_city)
  end

  it 'shows the name of the airline this flight belongs to' do
    expect(page).to have_content("Airline: #{@delta.name}")  
  end

  it 'shows the names of all passengers on this flight' do
    expect(page).to have_content(@jim.name)
    expect(page).to have_content(@pam.name)
    expect(page).to have_content(@stanley.name)
    expect(page).to have_content(@john.name)
    expect(page).to have_content(@sally.name)
    expect(page).to_not have_content(@michael.name)
  end
end