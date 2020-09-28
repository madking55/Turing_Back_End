require 'rails_helper'

RSpec.describe 'Contestants Index Page' do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @bachelorette_2 = Bachelorette.create!(name: "Suzie Q", season_number: 11, season_description: "Less dramatic than season 15!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
    @contestant_3 = @bachelorette_2.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")

    visit "/bachelorettes/#{@bachelorette_1.id}/contestants"
  end

  it "shows bachelorette's contestants names, age and hometown" do
    
    within(".contestant-#{@contestant_1.id}-info") do
      expect(page).to have_content("Name: #{@contestant_1.name}")
      expect(page).to have_content("Age: #{@contestant_1.age}")
      expect(page).to have_content("Hometown: #{@contestant_1.hometown}")
    end
    
    within(".contestant-#{@contestant_2.id}-info") do
      expect(page).to have_content("Name: #{@contestant_2.name}")
      expect(page).to have_content("Age: #{@contestant_2.age}")
      expect(page).to have_content("Hometown: #{@contestant_2.hometown}") 
    end
  end

  it 'has link on any contestants name to go to their show page' do

    click_link("#{@contestant_1.name}")
    expect(current_path).to eq("/contestants/#{@contestant_1.id}")

    visit "/bachelorettes/#{@bachelorette_1.id}/contestants"
    click_link("#{@contestant_2.name}")
    expect(current_path).to eq("/contestants/#{@contestant_2.id}")

  end
end
