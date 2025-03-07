require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'methods' do
    it '.average_age' do
      student_1 = Student.create!(name: 'Harry', age: 14, house: 'Gryffindor')
      student_2 = Student.create!(name: 'Hermione', age: 12, house: 'Gryffindor')
      student_3 = Student.create!(name: 'Luna', age: 13, house: 'Slytherin')
      
      expect(Student.average_age).to eq(13)
    end
  end

end
