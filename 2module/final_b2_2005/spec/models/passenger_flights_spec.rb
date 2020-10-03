require 'rails_helper'

RSpec.describe PassengerFlight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :passenger_id}
    it {should validate_presence_of :flight_id}
  end

  describe 'relationships' do
    it {should belong_to :passenger}
    it {should belong_to :flight}
  end
end