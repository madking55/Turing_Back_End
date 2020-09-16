require 'rails_helper'

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
    it '.average_age' do
      armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      behnken = Astronaut.create!(name: "Bob Behnken", age: 49, job: "Chief")

      expect(Astronaut.average_age).to eq(43)
    end

    it '#missions_alphabetically' do
      armstrong = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      behnken = Astronaut.create!(name: "Bob Behnken", age: 49, job: "Chief")

      gemini = Mission.create!(title: "Gemini 7", time_in_space: 40)
      apollo = Mission.create!(title: "Apollo 13", time_in_space: 14)
      capricorn = Mission.create!(title: "Capricorn 4", time_in_space: 24)
  
      armstrong_gemini = AstronautMission.create!(astronaut_id: armstrong.id, mission_id: gemini.id)
      armstrong_apollo = AstronautMission.create!(astronaut_id: armstrong.id, mission_id: apollo.id)
      armstrong_capricorn = AstronautMission.create!(astronaut_id: armstrong.id, mission_id: capricorn.id)

      expect(armstrong.missions_alphabetically).to eq("Apollo 13, Capricorn 4, Gemini 7")
      expect(behnken.missions_alphabetically).to eq("No Missions yet")
    end
  end
end
