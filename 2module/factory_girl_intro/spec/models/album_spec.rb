require 'rails_helper'

RSpec.describe Album do
  describe "attributes" do
    it "has a title" do
      album = build(:album)
      expect(album).to respond_to(:title)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:artist) }
  end

  describe "associations" do
    it "it has many tracks" do
      album      = create(:album)
      album2     = create(:album, title: "Emotionalism")
      create_list(:track, 3, album: album)
      create(:track, album: album2, name: 'Small Father')

      expect(Track.count).to eq 4
      expect(album.tracks.count).to eq 3
    end

    it "belongs to an artist" do
      artist = create(:artist)
      album = create(:album, artist: artist, title: "I and Love and You")

      expect(album.artist).to eq artist
    end
  end
end
