require 'rails_helper'

RSpec.describe 'Astronauts Index Page' do
  it 'shows a list of all astronauts' do
    armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
    behnken = Astronaut.create!(name: "Bob Behnken", age: 49, job: "Chief")

    visit '/astronauts'

    expect(page).to have_content(armstrong.name)
    expect(page).to have_content(armstrong.age)
    expect(page).to have_content(armstrong.job)
    expect(page).to have_content(behnken.name)
    expect(page).to have_content(behnken.age)
    expect(page).to have_content(behnken.job)
  end

  it 'shows the average age of all astronauts' do
    armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
    behnken = Astronaut.create!(name: "Bob Behnken", age: 49, job: "Chief")

    visit '/astronauts'

    expect(page).to have_content("Average Age: 43")
  end

  it 'shows missions in alphabetical order for each astronaut' do
    armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")

    gemini = Mission.create!(title: "Gemini 7", time_in_space: 40)
    apollo = Mission.create!(title: "Apollo 13", time_in_space: 14)
    capricorn = Mission.create!(title: "Capricorn 4", time_in_space: 24)

    armstrong_gemini = AstronautMission.create!(astronaut_id: armstrong.id, mission_id: gemini.id)
    armstrong_apollo = AstronautMission.create!(astronaut_id: armstrong.id, mission_id: apollo.id)
    armstrong_capricorn = AstronautMission.create!(astronaut_id: armstrong.id, mission_id: capricorn.id)

    visit '/astronauts'

    expect(page).to have_content("Missions: #{apollo.title}, #{capricorn.title}, #{gemini.title}")
  end
end