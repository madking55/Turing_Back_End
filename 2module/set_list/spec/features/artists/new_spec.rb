require 'rails_helper'

RSpec.describe 'New Artist' do 
  describe 'as a visitor' do 
    describe 'When I visit the new artist form by clicking a link on the index' do
      it 'I can create new artist' do 
        visit '/artists'

        expect(page).to_not have_content('Prince')

        click_link 'New Artist'

        expect(current_path).to eq('/artists/new') 

        fill_in 'Name', with: 'Prince'
        click_on 'Create Artist'

        expect(current_path).to eq('/artists')
        expect(page).to have_content('Prince')
      end
    end
  end
end