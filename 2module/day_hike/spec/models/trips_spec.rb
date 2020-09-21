require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name  }
  end

  describe 'relationships' do
    it { should have_many :trip_trails }
    it { should have_many(:trails).through(:trip_trails) }
  end

  describe 'methods' do
    before :each do 
      @trip_1 = Trip.create!(name: 'Trip One')
      @trail_1 = Trail.create!(name: "Zen Garden", address: "123 Zen Hike Trail", length: 2)
      @trail_2 = Trail.create!(name: "Angel Shore", address: "123 Angel Hike Trail", length: 3)
      TripTrail.create!(trip: @trip_1, trail: @trail_1)
      TripTrail.create!(trip: @trip_1, trail: @trail_2)
    end

    it '#total_distance' do
      expect(@trip_1.total_distance).to eq(5)
    end

    it '#average_distance' do
      expect(@trip_1.average_distance).to eq(2.5)
    end
  end
end