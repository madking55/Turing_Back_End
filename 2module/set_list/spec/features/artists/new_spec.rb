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

      it 'I can not create an artist without a name' do
        visit '/artists/new'
        click_on 'Create Artist'

        expect(page).to have_content('Artist not created: Required information missing.')
        expect(page).to have_button('Create Artist')
      end
    end
  end
end