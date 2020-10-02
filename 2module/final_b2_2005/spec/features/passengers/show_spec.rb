require 'rails_helper'

RSpec.describe 'Passenger Show Page' do
  before :each do
    @delta = Airline.create!(name: "Delta")
    @jet_blue = Airline.create!(name: "Jet Blue")
    @virgin = Airline.create!(name: "Virgin Atlantic")
    @flight_1 = @delta.flights.create!(number: 1, date: "08/03/2020", time: "5:00 PM", departure_city: "Denver", arrival_city: "Boston")
    @flight_2 = @jet_blue.flights.create!(number: 2, date: "08/04/2020", time: "7:00 AM", departure_city: "Denver", arrival_city: "New York")
    @flight_3 = @virgin.flights.create!(number: 4, date: "08/08/2020", time: "4:00 PM", departure_city: "Los Angeles", arrival_city: "Toronto")
    @jim = Passenger.create!(name: "Jim Halpert", age: 30)
    @pam = Passenger.create!(name: "Pam Beesly", age: 28)

    PassengerFlight.create!(flight: @flight_1, passenger: @jim)
    PassengerFlight.create!(flight: @flight_2, passenger: @jim)
    PassengerFlight.create!(flight: @flight_3, passenger: @jim)
  end

  it 'shows passenger name' do
    visit "/passengers/#{@jim.id}"
    expect(page).to have_content(@jim.name)
  end
  
  it 'has flight numbers of the flights for that passenger as links for those flights' do

    visit "/passengers/#{@jim.id}"
    within(".flight-#{@flight_1.id}") do
      expect(page).to have_content("Flight Number: #{@flight_1.number}")
      click_link "#{@flight_1.number}"
      expect(current_path).to eq("/flights/#{@flight_1.id}")
    end

    visit "/passengers/#{@jim.id}"
    within(".flight-#{@flight_2.id}") do
      expect(page).to have_content("Flight Number: #{@flight_2.number}")
      click_link "#{@flight_2.number}"
      expect(current_path).to eq("/flights/#{@flight_2.id}")
    end


    visit "/passengers/#{@jim.id}"
    within(".flight-#{@flight_3.id}") do
      expect(page).to have_content("Flight Number: #{@flight_3.number}")
      click_link "#{@flight_3.number}"
      expect(current_path).to eq("/flights/#{@flight_3.id}")
    end

    visit "/passengers/#{@pam.id}"
    within(".flights") do
      expect(page).to have_content("No flights yet")
    end
  end
end