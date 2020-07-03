require 'rails_helper'

RSpec.describe 'artists index page' do 
  it 'can see all artists names' do 
    carly_rae = Artist.create(name: 'Carly Rae')
    prince = Artist.create(name: 'Prince')

    visit '/artists'

    expect(page).to have_content('Prince')
    expect(page).to have_content('Carly Rae')
  end
end