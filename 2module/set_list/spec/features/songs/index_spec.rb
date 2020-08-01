require 'rails_helper'

RSpec.describe 'songs index page' do 
  it 'I can see all songs titles and play count' do 
    carly_rae = Artist.create(name: 'Carly Rae')
    prince = Artist.create(name: 'Prince')
    # Different ways to associate songs with artists:
    song_1 = Song.create(title: 'I Really Like You', length: 208, play_count: 243810867, artist: carly_rae)
    song_2 = Song.create(title: 'Call Me Maybe', length: 199, play_count: 1214722172, artist_id: carly_rae.id)
    song_3 = prince.songs.create(title: 'Purple Rain', length: 300, play_count: 1467408565)

    visit songs_path
    expect(page).to have_content(song_1.title) 
    expect(page).to have_content("Play Count: #{song_1.play_count}")

    expect(page).to have_content(song_3.title) 
    expect(page).to have_content("Play Count: #{song_3.play_count}")
  end
end