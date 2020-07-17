# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all
Course.destroy_all
StudentCourse.destroy_all

student_1 = Student.create!(name: 'Luna', age: 13, house: 'Slytherin')
student_2 = Student.create!(name: 'Hermione', age: 12, house: 'Gryffindor')
student_3 = Student.create!(name: 'Harry', age: 14, house: 'Gryffindor')

course_1 = Course.create!(name: 'Defense against the Dark Arts')
course_2 = Course.create!(name: 'Herbology')
course_3 = Course.create!(name: 'Potions')

StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
StudentCourse.create!(student_id: student_1.id, course_id: course_2.id)
StudentCourse.create!(student_id: student_2.id, course_id: course_2.id)
StudentCourse.create!(student_id: student_3.id, course_id: course_3.id)