require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should have_many :contestant_outings}
    it {should have_many(:outings).through(:contestant_outings)}
  end

  describe 'methods' do

    before :each do 
      @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
      @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
      @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
      @contestant_3 = @bachelorette_1.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")
      @outing_1 = Outing.create!(name: "Kickball", location: "Marfa, TX", date: Date.new(2020,10,28))
      @outing_2 = Outing.create!(name: "Hot Springs", location: "Idaho Springs, CO", date: Date.new(2020,10,26))
      ContestantOuting.create!(contestant_id: @contestant_1.id, outing_id: @outing_1.id)
      ContestantOuting.create!(contestant_id: @contestant_2.id, outing_id: @outing_1.id)
      ContestantOuting.create!(contestant_id: @contestant_3.id, outing_id: @outing_1.id)
    end

    it '#contestants_count' do
      expect(@outing_1.contestants_count).to eq(3)  
      expect(@outing_2.contestants_count).to eq(0)  
    end

    it '#contestants_names' do
      expect(@outing_1.contestants_names).to eq([@contestant_1.name, @contestant_2.name, @contestant_3.name])
      expect(@outing_2.contestants_names).to eq('No Contestants Yet')
    end
  end
end