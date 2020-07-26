RSpec.describe 'Park Show Page' do

  before :each do
    @hershey = Park.create!(name: 'Hershey Park', admission: 50)
    @runner = Ride.create!(name: 'Storm Runner', rating: 8, park_id: @hershey.id)
    @racer = Ride.create!(name: 'Lightning Racer', rating: 7, park_id: @hershey.id)
    @bear = Ride.create!(name: 'The Great Bear', rating: 9, park_id: @hershey.id)

    visit "/parks/#{@hershey.id}"
  end

  it 'shows name and admission for the park' do
    expect(page).to have_content("Name: Hershey Park")
    expect(page).to have_content("Admission: $50.00")
  end

  it 'shows names of all rides in the park in alphabetical order' do
    expect(page.all('li')[0]).to have_content('Lightning Racer')
    expect(page.all('li')[1]).to have_content('Storm Runner')
    expect(page.all('li')[2]).to have_content('The Great Bear')
  end

  it 'shows average thrill rating of the park rides' do
    expect(page).to have_content('Average Thrill Rating of Rides: 8.0/10')
  end
end