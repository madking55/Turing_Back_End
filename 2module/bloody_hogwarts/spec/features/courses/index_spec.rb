require 'rails_helper'

RSpec.describe 'Courses Index Page' do

  before :each do 
    @student_1 = Student.create!(name: 'Harry', age: 14, house: 'Gryffindor')
    @student_2 = Student.create!(name: 'Hermione', age: 12, house: 'Gryffindor')
    @student_3 = Student.create!(name: 'Luna', age: 13, house: 'Slytherin')
    @course_1 = Course.create!(name: 'Potions')
    @course_2 = Course.create!(name: 'Herbology')
    @course_3 = Course.create!(name: 'Defense against the Dark Arts')
    
    StudentCourse.create!(student_id: @student_1.id, course_id: @course_1.id)
    StudentCourse.create!(student_id: @student_1.id, course_id: @course_2.id)
    StudentCourse.create!(student_id: @student_2.id, course_id: @course_2.id)
    StudentCourse.create!(student_id: @student_3.id, course_id: @course_3.id)
  end

  it 'shows list of courses and the number of students enrolled' do

    visit '/courses'

    expect(page).to have_content("Potions - Number of Students enrolled: 1")
    expect(page).to have_content("Herbology - Number of Students enrolled: 2")
    expect(page).to have_content("Defense against the Dark Arts - Number of Students enrolled: 1")
  end

  it 'shows courses in alphabetical order' do

    visit '/courses'

    expect(page.all('h2')[0]).to have_content(@course_3.name)
    expect(page.all('h2')[1]).to have_content(@course_2.name)
    expect(page.all('h2')[2]).to have_content(@course_1.name)
  end

  it 'shows enrolled students in alphabetical order' do
    
    visit '/courses'

    expect(page.all('p')[1]).to have_content(@student_1.name)
    expect(page.all('p')[2]).to have_content(@student_2.name)
  end
end