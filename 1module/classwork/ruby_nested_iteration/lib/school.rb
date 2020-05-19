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
    students.each { |student| sort(student) }
  end

  def student_names
    students.map(&:name)
  end

  def students_by_house
    houses_hash = {}
     @houses.each do |house|
      houses_hash[house] = []
    end
    students.each do |student|
     houses_hash[student.house] << student
    end
    houses_hash
  end

  private

  def students
    @courses.map(&:students).flatten.uniq
  end
end
