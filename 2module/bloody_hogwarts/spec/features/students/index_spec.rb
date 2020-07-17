require 'rails_helper'

RSpec.describe 'Students Index Page' do

  before :each do
    @student_1 = Student.create!(name: 'Luna', age: 13, house: 'Slytherin')
    @student_2 = Student.create!(name: 'Hermione', age: 12, house: 'Gryffindor')
    @student_3 = Student.create!(name: 'Harry', age: 14, house: 'Gryffindor')
    @course_1 = Course.create!(name: 'Defense against the Dark Arts')
    @course_2 = Course.create!(name: 'Herbology')
    @course_3 = Course.create!(name: 'Potions')
  end
 
  it 'I can see list of students with their name, age and house' do

    visit '/students'

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_1.age)
    expect(page).to have_content(@student_2.age)
    expect(page).to have_content(@student_2.house)
    expect(page).to have_content(@student_3.house)
    expect(page).to have_content(@student_3.name)
  end

  it 'I can see the average age of all students' do

    visit '/students'      
    
    expect(page).to have_content("Average Age of all Students: 13.0")
  end

  it 'shows students in alphapethical order' do
    
    visit '/students'
    
    expect(page.all('h3')[0]).to have_content(@student_3.name)
    expect(page.all('h3')[1]).to have_content(@student_2.name)
    expect(page.all('h3')[2]).to have_content(@student_1.name)
  end

end

