require 'rails_helper'

RSpec.describe MediaType do
  describe "attributes" do
    it "has a name" do
      media = MediaType.new

      expect(media).to respond_to(:name)
    end
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it "a media type can have multiple tracks" do
      media_type  = MediaType.create(name: "LazerDisk")
      media_type2 = MediaType.create(name: "mp3")
      album       = Album.create(title: "Ring Away")
      genre       = Genre.create(name: "R&B")

      track1 = Track.create(
        name: "Big Poppa", 
        genre: genre,
        album: album,
        media_type: media_type,
        milliseconds: 10
      )
      track2 = Track.create(
        name: "Pig Boppa", 
        genre: genre,
        album: album,
        media_type: media_type,
        milliseconds: 10
      )
      track3 = Track.create(
        name: "Small Father", 
        genre: genre,
        album: album,
        media_type: media_type2,
        milliseconds: 10
      )

      expect(Track.count).to eq 3
      expect(media_type.tracks.count).to eq 2
      expect(media_type.tracks.last.name).to eq "Pig Boppa"
    end
  end
end

