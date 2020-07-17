require 'rails_helper'


RSpec.describe "Students Show Page" do
  
  it 'I can see list of students courses' do
    @student_1 = Student.create!(name: 'Luna', age: 13, house: 'Slytherin')
    @student_2 = Student.create!(name: 'Hermione', age: 12, house: 'Gryffindor')
    @student_3 = Student.create!(name: 'Harry', age: 14, house: 'Gryffindor')
    @course_1 = Course.create!(name: 'Defense against the Dark Arts')
    @course_2 = Course.create!(name: 'Herbology')
    @course_3 = Course.create!(name: 'Potions')
    StudentCourse.create!(student_id: @student_1.id, course_id: @course_1.id)
    StudentCourse.create!(student_id: @student_1.id, course_id: @course_2.id)
    StudentCourse.create!(student_id: @student_2.id, course_id: @course_2.id)
    StudentCourse.create!(student_id: @student_3.id, course_id: @course_3.id)

    visit "/students/#{@student_1.id}"

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@course_1.name)
    expect(page).to have_content(@course_2.name)

  end
end