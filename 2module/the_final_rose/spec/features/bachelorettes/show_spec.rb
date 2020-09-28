require 'rails_helper'

RSpec.describe 'Bachelorettes Show Page' do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @bachelorette_2 = Bachelorette.create!(name: "Suzie Q", season_number: 11, season_description: "Less dramatic than season 15!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
    @contestant_3 = @bachelorette_2.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")

    visit "/bachelorettes/#{@bachelorette_1.id}"
  end

  it 'shows bachelorette name, season number and description' do
    expect(page).to have_content("Name: #{@bachelorette_1.name}")
    expect(page).to have_content("Season #{@bachelorette_1.season_number} - #{@bachelorette_1.season_description}")
  end

  it 'has a link to contestants that belong to bachelorette' do
    expect(page).to have_link('Contestants')
    click_link 'Contestants'

    expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")
    expect(page).to have_content("#{@contestant_1.name}")
    expect(page).to have_content("#{@contestant_2.name}")
    expect(page).not_to have_content("#{@contestant_3.name}")
  end
end