RSpec.describe Mechanic do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_of_exp}
  end

  describe 'relationshios' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end
end