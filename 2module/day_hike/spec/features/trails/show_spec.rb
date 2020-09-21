require 'rails_helper'

RSpec.describe 'Trail Show Page' do
  before :each do
    @trip_1 = Trip.create!(name: 'Trip One')
    @trip_2 = Trip.create(name: 'Trip Two')
    @trail_1 = Trail.create!(name: "Zen Garden", address: "123 Zen Hike Trail", length: 2)
    @trail_2 = Trail.create!(name: "Angel Shore", address: "123 Angel Hike Trail", length: 3)
    @trail_3 = Trail.create!(name: "Sunset Valley", address: "123 Sunset Hike Trail", length: 4)
    TripTrail.create!(trip: @trip_1, trail: @trail_1)
    TripTrail.create!(trip: @trip_2, trail: @trail_1)
    TripTrail.create!(trip: @trip_1, trail: @trail_2)

    visit "/trails/#{@trail_1.id}"
  end

  it 'shows name and address of this trail' do
    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content("Address: #{@trail_1.address}")
  end

  it 'shows name and total length of every trip that includes this trail' do
    within(".trip-#{@trip_1.id}-details") do
      expect(page).to have_content(@trip_1.name) 
      expect(page).to have_content(@trip_1.total_distance)
    end
    within(".trip-#{@trip_2.id}-details") do
      expect(page).to have_content(@trip_2.name) 
      expect(page).to have_content(@trip_2.total_distance)
    end
  end
end