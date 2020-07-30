RSpec.describe 'Astronauts Index Page' do
  before :each do 
    @armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
    @behnken = Astronaut.create!(name: "Bob Behnken", age: 49, job: "Chief")

    visit '/astronauts'
  end

  it 'lists all astronauts with their name, age nad job' do

    expect(page).to have_content(@armstrong.name)
    expect(page).to have_content(@armstrong.age)
    expect(page).to have_content(@armstrong.job)
    expect(page).to have_content(@behnken.name)
    expect(page).to have_content(@behnken.age)
    expect(page).to have_content(@behnken.job)
  end

  it 'shows average age of all astronauts' do
    expect(page).to have_content("Average Age of Astronauts: 43")
  end

  it 'lists space missions for each astronaut in alphabetical order' do
    gemini = Mission.create!(title: "Gemini 7", time_in_space: 40)
    apollo = Mission.create!(title: "Apollo 13", time_in_space: 14)
    capricorn = Mission.create!(title: "Capricorn 4", time_in_space: 24)

    AstronautMission.create!(astronaut_id: @armstrong.id, mission_id: gemini.id)
    AstronautMission.create!(astronaut_id: @armstrong.id, mission_id: apollo.id)
    AstronautMission.create!(astronaut_id: @armstrong.id, mission_id: capricorn.id)

    within("#astronaut-#{@armstrong.id}") do
      expect(page).to have_content("Missions: #{apollo.title}, #{capricorn.title}, #{gemini.title}")
    end

    within("#astronaut-#{@behnken.id}") do
    expect(page).to have_content("Missions: No Missions yet")

  end
end