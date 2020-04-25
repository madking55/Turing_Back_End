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

modules = {
  mod_1: [student_1, student_2, student_3],
  mod_2: [],
  mod_3: [student_4],
  mod_4: [student_5]
}

# array of all mods as symbols that have more than one student
p modules.select { |k,v| v.size > 1 }.keys

# hash that associates a mod with an array of students names
hash = {}
modules.each { |k,v| hash[k] = v.map(&:name) }
p hash

# which mod has the most students
p modules.max_by { |k,v| v.size }

# hash that associoates a mod with student with the name of the Student highest id
hash = {}
modules.each { |k,v| hash[k] = v.max_by(&:id) }
p hash



