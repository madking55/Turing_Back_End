require 'rails_helper'

RSpec.describe 'show songs that belong to artist' do
  it "can show artist's songs" do 
    muse = Artist.create!(name: 'Muse')
    song_1 = muse.songs.create!(title: 'Hysteria', length: 550, play_count: 54321)
    song_2 = muse.songs.create!(title: 'Algorithms', length: 432, play_count: 76535)

    prince = Artist.create!(name: 'Prince')
    song_3 = prince.songs.create!(title: 'Purple Rain', length: 250, play_count: 15673)

    visit "/artists/#{muse.id}/songs"

    expect(current_path).to eq("/artists/#{muse.id}/songs")
    expect(page).to have_content("Hysteria")
    expect(page).to have_content("Algorithms")
    expect(page).to have_no_content("Purple Rain")
  end
end