RSpec.describe Park do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :admission}
  end

  describe 'methods' do
    it 'returns admission with precision and currency' do
      hershey = Park.create!(name: 'Hershey Park', admission: 50)
      expect(hershey.admission_to_currency).to eq('$50.00')
    end
  end
end