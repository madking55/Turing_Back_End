require 'rails_helper'

RSpec.describe 'Outing Show Page' do
  before :each do 
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
    @contestant_3 = @bachelorette_1.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")
    @outing_1 = Outing.create!(name: "Kickball", location: "Marfa, TX", date: Date.new(2020,10,28))
    @outing_2 = Outing.create!(name: "Hot Springs", location: "Idaho Springs, CO", date: Date.new(2020,10,26))
    ContestantOuting.create!(contestant_id: @contestant_1.id, outing_id: @outing_1.id)
    ContestantOuting.create!(contestant_id: @contestant_2.id, outing_id: @outing_1.id)
    ContestantOuting.create!(contestant_id: @contestant_3.id, outing_id: @outing_1.id)
  end

  it 'shows outing name, location and date' do
    visit "/outings/#{@outing_1.id}"
    expect(page).to have_content(@outing_1.name)
    expect(page).to have_content(@outing_1.location)
    expect(page).to have_content(@outing_1.date)
    
    visit "/outings/#{@outing_2.id}"
    expect(page).to have_content(@outing_2.name)
    expect(page).to have_content(@outing_2.location)
    expect(page).to have_content(@outing_2.date)
  end
  
  it 'shows total count and names of contestantsthat went on that outing' do
    visit "/outings/#{@outing_1.id}"
    expect(page).to have_content("Count of Contestants: #{@outing_1.contestants_count}")
    expect(page).to have_content("Contestants: #{@outing_1.contestants_names}")
    
    visit "/outings/#{@outing_2.id}"
    expect(page).to have_content("Count of Contestants: #{@outing_2.contestants_count}")
  end

end
