require 'rails_helper'

RSpec.describe "Trips Show Page" do 
  before :each do 
    @trip_1 = Trip.create!(name: 'Trip One')
    @trail_1 = Trail.create!(name: "Zen Garden", address: "123 Zen Hike Trail", length: 2)
    @trail_2 = Trail.create!(name: "Angel Shore", address: "123 Angel Hike Trail", length: 3)
    TripTrail.create!(trip: @trip_1, trail: @trail_1)
    TripTrail.create!(trip: @trip_1, trail: @trail_2)

    visit "/trips/#{@trip_1.id}"
  end

  it 'lists trails included in the trip' do

    expect(page).to have_content("All Trails for #{@trip_1.name}")

    @trip_1.trails.each do |trail|
      within(".trail-#{trail.id}-details") do
        expect(page).to have_content("Name: #{trail.name}")
        expect(page).to have_content("Address: #{trail.address}")
        expect(page).to have_content("Length: #{trail.length}")
      end
    end
  end

  it 'shows the total hiking distance of all trails on that trip' do
    expect(page).to have_content("Total Hiking Distance: #{@trip_1.total_distance}")
  end

  it 'shows the average hiking distance of all trail on that trip' do
    expect(page).to have_content("Average Hiking Distance: #{@trip_1.average_distance}")
  end
  
  it 'shows the name of the longest trail included on that trip' do
    expect(page).to have_content("Longest Trip Trail: #{@trail_2.name}, Distance: #{@trail_2.length}")
  end

  it 'shows the name of the shortest trail included on that trip' do
    expect(page).to have_content("Shortest Trip Trail: #{@trail_1.name}, Distance: #{@trail_1.length}")
  end
end