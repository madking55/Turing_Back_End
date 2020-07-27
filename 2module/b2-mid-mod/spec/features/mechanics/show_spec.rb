RSpec.describe 'Mechanic Show Page' do
  before :each do
    @mechanic_1 = Mechanic.create(name: 'Sam Mills', years_of_exp: 10)
    @hershey = Park.create!(name: 'Hershey Park', admission: 50)
    @runner = Ride.create!(name: 'Storm Runner', rating: 8, park_id: @hershey.id)
    @racer = Ride.create!(name: 'Lightning Racer', rating: 7, park_id: @hershey.id)
    @bear = Ride.create!(name: 'The Great Bear', rating: 9, park_id: @hershey.id)

    RideMechanic.create!(mechanic_id: @mechanic_1.id, ride_id: @runner.id)
    RideMechanic.create!(mechanic_id: @mechanic_1.id, ride_id: @racer.id)

    visit "mechanics/#{@mechanic_1.id}"
  end

  it 'shows name, years of exp and rides they are working on' do
    expect(page).to have_content("Mechanic: #{@mechanic_1.name}")
    expect(page).to have_content("Years of Experience: #{@mechanic_1.years_of_exp}")
    expect(page).to have_content("#{@runner.name}")
    expect(page).to have_content("#{@racer.name}")
    expect(page).to_not have_content("#{@bear.name}")
  end

  it 'has a form to add a ride to their workload' do
    
  end
end