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
    expect(page).to have_content("Average Age: 43")
  end
end