require 'rails_helper'

RSpec.describe Track do
  describe "attributes" do
    it "has a name, composer, and millisecond amount" do
      track = build(:track)

      expect(track).to respond_to(:name)
      expect(track).to respond_to(:composer)
      expect(track).to respond_to(:milliseconds)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:media_type) }
    it { is_expected.to validate_presence_of(:milliseconds) }
  end

  describe "associations" do
    it { is_expected.to have_many(:playlist_tracks) }
    it { is_expected.to have_many(:playlists).through(:playlist_tracks) }

    it "is associated with a genre" do
      track = build(:track)

      expect(track.genre).not_to be nil
    end

    it "is on an album" do
      track = build(:track)

      expect(track.album).not_to be nil
    end

    it "has a media type" do
      track = build(:track)
 
      expect(track.media_type).not_to be nil
    end

    it "can be on many playlists" do
      track = create(:track)

      playlist1 = create(:playlist)
      playlist2 = create(:playlist)

      playlist1.tracks << track
      playlist2.tracks << track

      expect(track.playlists).to match_array [playlist1, playlist2]
    end
  end

end
