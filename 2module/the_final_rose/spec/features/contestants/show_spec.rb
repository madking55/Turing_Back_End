require 'rails_helper'

RSpec.describe 'Contestant Show Page' do


  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
    @outing_1 = Outing.create!(name: "Kickball", location: "Marfa, TX", date: Date.new(2020,10,28))
    @outing_2 = Outing.create!(name: "Hot Springs", location: "Idaho Springs, CO", date: Date.new(2020,10,26))
    ContestantOuting.create!(contestant_id: @contestant_1.id, outing_id: @outing_1.id)
    ContestantOuting.create!(contestant_id: @contestant_1.id, outing_id: @outing_2.id)
    visit "/contestants/#{@contestant_1.id}"
  end

  
  it 'shows contestants name, season number and description' do
    expect(page).to have_content("Contestant: #{@contestant_1.name}")
    expect(page).to have_content("Season #{@bachelorette_1.season_number} - #{@bachelorette_1.season_description}")
  end
  
  it 'has links for outing names' do

    expect(page).to have_link(@outing_1.name)
    expect(page).to have_link(@outing_2.name)
    click_link(@outing_1.name)
    expect(current_path).to eq("/outings/#{@outing_1.id}")
  end
end