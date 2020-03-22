class School
  attr_reader :name, :houses, :courses

  def initialize(name, houses)
    @name = name
    @houses = houses
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def sort(student)
    student.house = @houses.sample
  end

  def sort_students
    @courses.each do |course|
      course.students.each { |student| sort(student) }
    end
  end

  def student_names
    student_names = []
    @courses.each do |course| 
      course.students.each do |student| 
        student_names << student.name unless student_names.include?(student.name) 
      end
    end
    student_names
  end

  def students_by_house
    students_by_house = Hash.new([])
    @courses.each do |course|
      course.students.each do |student|
        students_by_house[student.house] += [student] unless students_by_house[student.house].include?(student)
      end
    end
    students_by_house
  end
end
