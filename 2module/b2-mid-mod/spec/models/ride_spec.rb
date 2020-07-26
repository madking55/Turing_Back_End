RSpec.describe Ride do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :park_id}
  end

  describe 'relationships' do
    it {should belong_to :park}
  end

  describe 'methods' do
    before :each do
      @hershey = Park.create!(name: 'Hershey Park', admission: 50)
      @runner = Ride.create!(name: 'Storm Runner', rating: 8, park_id: @hershey.id)
      @racer = Ride.create!(name: 'Lightning Racer', rating: 7, park_id: @hershey.id)
      @bear = Ride.create!(name: 'The Great Bear', rating: 9, park_id: @hershey.id)
    end

    describe '.alphabetical_order' do
      it 'lists rides in alphabetical order' do
        expect(@hershey.rides.alphabetical_order).to eq([@racer, @runner, @bear])
      end
    end

    describe '.average_rating' do
      it 'returns average thrill rating of rides' do
        expect(@hershey.rides.average_rating).to eq(8)
      end
    end
  end
end