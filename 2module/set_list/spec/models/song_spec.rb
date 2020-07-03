require 'rails_helper'

# Three main things we are testing here:
# 1. validations
# 2. relationships
# 3. class / instance methods

RSpec.describe Song do
  describe 'validations' do
    it { should validate_presence_of :title }
  end

  describe 'relationships' do
    it { should belong_to :artist }
  end

  describe 'class methods' do
    it '.song_count' do
      prince = Artist.create!(name: 'Prince')
      talking_heads = Artist.create!(name: 'Talking Heads')
      rasperry_beret = prince.songs.create!(title: 'Raspberry Beret', length: 234, play_count: 34)
      wild_life = talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 45)

      expect(Song.song_count).to eq(2) 
    end
  end
end