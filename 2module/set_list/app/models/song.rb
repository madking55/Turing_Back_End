class Song < ApplicationRecord
  validates_presence_of :title
  belongs_to :artist # now artist is a method you can call on Song
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  def self.song_count
    Song.all.count
  end
end