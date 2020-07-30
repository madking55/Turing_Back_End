describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Methods' do
    describe '.average_age' do
      it 'returns astronauts average age' do
        armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
        behnken = Astronaut.create!(name: "Bob Behnken", age: 49, job: "Chief")
        expect(Astronaut.average_age).to eq(43)
      end
    end
  end
end
