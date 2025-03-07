require 'rails_helper'

RSpec.describe 'Passenger Show Page' do
  before :each do
    @delta = Airline.create!(name: "Delta")
    @jet_blue = Airline.create!(name: "Jet Blue")
    @virgin = Airline.create!(name: "Virgin Atlantic")
    @flight_1 = @delta.flights.create!(number: 1, date: "08/03/2020", time: "5:00 PM", departure_city: "Denver", arrival_city: "Boston")
    @flight_2 = @jet_blue.flights.create!(number: 2, date: "08/04/2020", time: "7:00 AM", departure_city: "Denver", arrival_city: "New York")
    @flight_3 = @virgin.flights.create!(number: 4, date: "08/08/2020", time: "4:00 PM", departure_city: "Los Angeles", arrival_city: "Toronto")
    @flight_4 = @delta.flights.create!(number: 3, date: "08/16/2020", time: "9:00 AM", departure_city: "London", arrival_city: "Tokyo")
    @jim = Passenger.create!(name: "Jim Halpert", age: 30)
    @pam = Passenger.create!(name: "Pam Beesly", age: 28)

    PassengerFlight.create!(flight: @flight_1, passenger: @jim)
    PassengerFlight.create!(flight: @flight_2, passenger: @jim)
    PassengerFlight.create!(flight: @flight_3, passenger: @jim)
  end

  it 'shows passenger name' do
    visit passenger_path(@jim.id)
    expect(page).to have_content(@jim.name)
  end
  
  it 'has flight numbers of the flights for that passenger as links for those flights' do
    
    visit passenger_path(@jim.id)
    within(".flight-#{@flight_1.id}") do
      expect(page).to have_content("Flight Number: #{@flight_1.number}")
      click_link "#{@flight_1.number}"
      expect(current_path).to eq("/flights/#{@flight_1.id}")
    end

    visit passenger_path(@jim.id)
    within(".flight-#{@flight_2.id}") do
      expect(page).to have_content("Flight Number: #{@flight_2.number}")
      click_link "#{@flight_2.number}"
      expect(current_path).to eq("/flights/#{@flight_2.id}")
    end

    visit passenger_path(@jim.id)
    within(".flight-#{@flight_3.id}") do
      expect(page).to have_content("Flight Number: #{@flight_3.number}")
      click_link "#{@flight_3.number}"
      expect(current_path).to eq("/flights/#{@flight_3.id}")
    end

    visit passenger_path(@pam.id)
    within(".flights") do
      expect(page).to have_content("No flights yet")
    end
  end

  it 'has form to add a flight' do

    visit passenger_path(@jim.id)
    within(".add-flight-form") do
      expect(page).to have_content("Add Flight for #{@jim.name}")
      fill_in 'Flight Number', with: @flight_4.number
      click_on 'Add Flight'
    end

    expect(current_path).to eq(passenger_path(@jim.id))

    visit passenger_path(@jim.id)
    within ".flight-#{@flight_4.id}" do
      expect(page).to have_content("Flight Number: #{@flight_4.number}")
      click_link "#{@flight_4.number}"
      expect(current_path).to eq("/flights/#{@flight_4.id}")
    end
  end

  it 'can not to add flight without a number' do
    visit passenger_path(@jim.id)

    within '.add-flight-form' do
      click_on 'Add Flight'
    end

    expect(current_path).to eq(passenger_path(@jim.id))
    expect(page).to have_content("Flight number can't be blank")
  end

  it 'can not add a duplicate flight' do
    visit passenger_path(@jim.id)

    within '.add-flight-form' do
      fill_in 'Flight Number', with: @flight_4.number
      click_on 'Add Flight'
    end

    within '.add-flight-form' do
      fill_in 'Flight Number', with: @flight_4.number
      click_on 'Add Flight'
    end

    expect(current_path).to eq(passenger_path(@jim.id))
    expect(page).to have_content("This flight already exists")
  end
end