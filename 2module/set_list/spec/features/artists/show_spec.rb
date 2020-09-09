require 'rails_helper'

RSpec.describe 'Artist Show Page' do
  it "can show all artist's songs" do 
    muse = Artist.create!(name: 'Muse')
    song_1 = muse.songs.create!(title: 'Hysteria', length: 550, play_count: 54321)
    song_2 = muse.songs.create!(title: 'Algorithms', length: 432, play_count: 76535)

    prince = Artist.create!(name: 'Prince')
    song_3 = prince.songs.create!(title: 'Purple Rain', length: 250, play_count: 15673)

    visit artist_path(muse)

    expect(current_path).to eq(artist_path(muse))
    expect(page).to have_content("Hysteria")
    expect(page).to have_content("Algorithms")
    expect(page).to have_no_content("Purple Rain")
  end
end