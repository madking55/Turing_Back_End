# As a visitor,
# when I visit the hiking trips index page,
# I see a list of all hiking trip names in
# the database.
require 'rails_helper'

RSpec.describe 'Trips Index Page' do
  it 'lists names of all trips' do
    trip_1 = Trip.create!(name: 'Trip One')
    trip_2 = Trip.create!(name: 'Trip Two')

    visit '/trips'

    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_2.name)
  end
end