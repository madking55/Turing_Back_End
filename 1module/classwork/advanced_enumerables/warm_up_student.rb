class Student
  attr_reader :name, :id

  def initialize(name ,id)
    @name = name
    @id = id
  end
end

student_1 = Student.new("Megan", 4)
student_2 = Student.new("Brian", 9)
student_3 = Student.new("Sal", 1)
student_4 = Student.new("Mike", 2)
student_5 = Student.new("Amy", 5)

students = [student_1, student_2, student_3, student_4, student_5]

# array of students names
p students.map(&:name)

# array of students with names starting with "M"
p students.select { |student| student.name[0] == "M"}

# get the student with id 1
p students.select { |student| student.id == 1 }

# check if one student is named "Amy"
p students.one? { |student| student.name == "Amy" }

# check if any student has id of 10
p students.any? { |student| student.id == 10 }

# find tyhe student with the highest id
p students.max_by(&:id)

# array with students in order of name alphabetically
p students.sort_by(&:name)

# array with students in order of name by length
p students.sort_by { |student| student.name.length }
