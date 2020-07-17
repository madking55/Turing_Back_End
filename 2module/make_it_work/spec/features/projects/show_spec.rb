require 'rails_helper'

RSpec.describe 'Projects Show Page' do

  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end
  
  it 'shows project name and material, and chellenge theme' do
  
    visit "projects/#{@news_chic.id}"

    expect(page).to have_content("Name: News Chic")
    expect(page).to have_content("Material: Newspaper")
    expect(page).to have_content("Challenge Theme: Recycled Material")
  end

  it 'shows a number of contestants on particular project' do

    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content("Number of Contestants: #{@news_chic.contestant_count}")

    visit "/projects/#{@upholstery_tux.id}"
    expect(page).to have_content("Number of Contestants: #{@upholstery_tux.contestant_count}")

    visit "/projects/#{@boardfit.id}"
    expect(page).to have_content("Number of Contestants: #{@boardfit.contestant_count}")
    
    visit "/projects/#{@lit_fit.id}"
    expect(page).to have_content("Number of Contestants: #{@lit_fit.contestant_count}")
  end

  it 'shows average years of experience for contestants on particuylar project' do

    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content("Average Contestant Experience: #{@news_chic.average_experience} years")

    visit "/projects/#{@upholstery_tux.id}"
    expect(page).to have_content("Average Contestant Experience: #{@upholstery_tux.average_experience} years")

    visit "/projects/#{@boardfit.id}"
    expect(page).to have_content("Average Contestant Experience: #{@boardfit.average_experience} years")
    
    visit "/projects/#{@lit_fit.id}"
    expect(page).to have_content("Average Contestant Experience: #{@lit_fit.average_experience} years")
  end

  it 'can add a contestant to particular project via a form' do

    visit "/projects/#{@news_chic.id}"

    expect(@news_chic.contestant_count).to eq(2)

    fill_in :contestant_id, with: @kentaro.id
    click_button "Add Contestant To Project"

    expect(current_path).to eq("/projects/#{@news_chic.id}")
    expect(@news_chic.contestant_count).to eq(3)

    visit '/contestants'

    within("#contestant-#{@kentaro.id}") do
      expect(@kentaro.project_list).to include(@news_chic.name)
    end
  end
end