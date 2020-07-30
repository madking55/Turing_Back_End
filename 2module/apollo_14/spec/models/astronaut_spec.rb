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

    before :each do
      @armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @behnken = Astronaut.create!(name: "Bob Behnken", age: 49, job: "Chief")
    end

    describe '.average_age' do
      it 'returns astronauts average age' do
        expect(Astronaut.average_age).to eq(43)
      end
    end

    describe '.alphabetical_order' do
      it 'lists misiions in alphabetical order' do

        gemini = Mission.create!(title: "Gemini 7", time_in_space: 40)
        apollo = Mission.create!(title: "Apollo 13", time_in_space: 14)
        capricorn = Mission.create!(title: "Capricorn 4", time_in_space: 24)
    
        AstronautMission.create!(astronaut_id: @armstrong.id, mission_id: gemini.id)
        AstronautMission.create!(astronaut_id: @armstrong.id, mission_id: apollo.id)
        AstronautMission.create!(astronaut_id: @armstrong.id, mission_id: capricorn.id)

        expect(@armstrong.missions.alphabetical_titles).to eq([apollo.title, capricorn.title, gemini.title])
      end
    end
  end
end
