RSpec.describe 'Edit Artist' do 
  describe 'as a visitor' do 
    describe 'When I visit the artists index' do
      it 'I can edit artist' do 
        beatles = Artist.create(name: 'Beatles')

        visit artists_path
        click_on "Edit #{beatles.name}"

        expect(current_path).to eq(edit_artist_path(beatles)) 

        fill_in 'Name', with: 'The Beatles'
        click_on 'Update Artist'

        expect(current_path).to eq(artists_path)
        expect(page).to have_content('The Beatles')
      end
    end
  end
end