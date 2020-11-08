require 'rails_helper'

RSpec.describe PropublicaService do
  describe 'instance methods' do
    describe '#members_of_house(state' do
      it 'returns members data' do
        search = PropublicaService.members_of_house('CO')
        expect(search[:results]).to be_an Array

        member_data = search[:results].first
        expect(member_data).to have_key :name
        expect(member_data[:name]).to be_a String
        expect(member_data).to have_key :role
        expect(member_data[:role]).to be_a String
        expect(member_data).to have_key :district
        expect(member_data[:district]).to be_a String
        expect(member_data).to have_key :party
        expect(member_data[:party]).to be_a String
      end
    end
  end
end