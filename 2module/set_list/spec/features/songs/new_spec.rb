require 'rails_helper'

RSpec.describe 'creating a new song' do
  it 'can create new song' do
    artist = Artist.create!(name: 'Prince')
    title = 'Purple Rain'
    length = 250
    play_count = 15673

    visit "/artists/#{artist.id}/songs/new"

    fill_in :title, with: title
    fill_in :length, with: length
    fill_in :play_count, with: play_count

    click_on 'Create Song'

    new_song = Song.last

    expect(current_path).to eq("/songs/#{new_song.id}")
    expect(page).to have_content(artist.name)
    expect(page).to have_content(title)
    expect(page).to have_content(length)
    expect(page).to have_content(play_count)
  end
end