require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'methods' do

    before :each do
      @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
      @bachelorette_2 = Bachelorette.create!(name: "Suzie Q", season_number: 11, season_description: "Less dramatic than season 15!")
      @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
      @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
      @contestant_3 = @bachelorette_2.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")
    end

    it '#contestants_avg_age' do
      expect(@bachelorette_1.contestants_avg_age).to eq(31)
      expect(@bachelorette_2.contestants_avg_age).to eq(24)
    end

    it '#contestants_unique_hometowns' do
      @contestant_4 = @bachelorette_1.contestants.create!(name: "Mr Colorado", age: 36, hometown: "Denver, CO")
      @contestant_5 = @bachelorette_1.contestants.create!(name: "Mr California", age: 46, hometown: "Los Angeles, CA")

      expect(@bachelorette_1.contestants_unique_hometowns).to eq(["Denver, CO", "Irving, TX", "Los Angeles, CA"])
    end
  end
end
