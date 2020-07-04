RSpec.describe 'Edit Artist' do 
  describe 'as a visitor' do 
    describe 'When I visit the artists index' do
      it 'I can edit artist' do 
        beatles = Artist.create(name: 'Beatles')

        visit '/artists'
        click_on "Edit #{beatles.name}"

        expect(current_path).to eq("/artists/#{beatles.id}/edit") 

        fill_in :name, with: 'The Beatles'
        click_on 'Update Artist'

        expect(current_path).to eq('/artists')
        expect(page).to have_content('The Beatles')
      end
    end
  end
end