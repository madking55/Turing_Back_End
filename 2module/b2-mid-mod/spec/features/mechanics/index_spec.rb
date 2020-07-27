RSpec.describe 'Meachanics Index Page' do
  it 'shows list of all mechanics with their names and experience' do
    mechanic_1 = Mechanic.create(name: 'Sam Mills', years_of_exp: 10)
    mechanic_2 = Mechanic.create(name: 'Kara Smith', years_of_exp: 11)

    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
    within("#mechanic-#{mechanic_1.id}") do
      expect(page).to have_content("#{mechanic_1.name} - #{mechanic_1.years_of_exp} years of experience")
    end

    within("#mechanic-#{mechanic_2.id}") do
      expect(page).to have_content("#{mechanic_2.name } - #{mechanic_2.years_of_exp} years of experience")
    end
  end
end