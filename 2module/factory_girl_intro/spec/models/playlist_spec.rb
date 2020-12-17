require 'rails_helper'

RSpec.describe Playlist do
  describe "attributes" do
    it "has a name" do
      playlist = build(:playlist)

      expect(playlist).to respond_to(:name)
    end
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { is_expected.to have_many(:playlist_tracks) }

    it "has many tracks" do
      playlist = create(:playlist)

      playlist_tracks = create_list(:track, 2)
      create(:track)

      playlist.tracks << playlist_tracks

      expect(Track.count).to eq(3)
      expect(playlist.tracks.count).to eq(2)
    end
  end
end
