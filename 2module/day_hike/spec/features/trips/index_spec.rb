require 'rails_helper'

RSpec.describe 'Trips Index Page' do
  before :each do
    @trip_1 = Trip.create!(name: 'Trip One')
    @trip_2 = Trip.create!(name: 'Trip Two')
  
    visit '/trips'
  end

  it 'lists names of all trips' do
    expect(page).to have_content(@trip_1.name)
    expect(page).to have_content(@trip_2.name)
  end

  it 'has links to see a unique page for every trip' do
    click_on "#{@trip_1.name}"
    expect(current_path).to eq("/trips/#{@trip_1.id}")

    visit '/trips'
    click_on "#{@trip_2.name}"
    expect(current_path).to eq("/trips/#{@trip_2.id}")
  end
end