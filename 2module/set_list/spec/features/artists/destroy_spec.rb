require 'rails_helper'

RSpec.describe 'When I visit the artists index page' do
  it 'I can delete an artist' do
    prince = Artist.create(name: 'Prince')
    carly_rae = Artist.create(name: 'Carly Rae')
    britney = Artist.create(name: 'Britney Spears')

    visit artists_path

    expect(page).to have_content('Britney Spears')
    
    click_on 'Delete Britney Spears'
    
    expect(page).to have_no_content('Britney Spears')
  end
end