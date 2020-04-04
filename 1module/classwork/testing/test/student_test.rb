require 'minitest/autorun'
require 'minitest/pride'
require './lib/student'

class StudentTest < Minitest::Test
  # test it exists
  def test_it_exists
    student = Student.new('Penelope')
    assert_instance_of Student, student
  end
  
  # test it has a name
  def test_student_has_name
    student = Student.new('Penelope')
    assert_equal 'Penelope', student.name
  end

  def test_student_can_have_a_different_name
    student = Student.new('Hermione')
    assert_equal 'Hermione', student.name
  end

  # test it has cookies
  def test_it_has_cookies
    student = Student.new('Penelope')
    assert_equal [], student.cookies
  end

  # test it can add cookies
  def test_it_can_add_cookies
    student = Student.new('Penelope')
    student.add_cookie('Chocolate')
    student.add_cookie('Oreo')
    assert_equal %w[Chocolate Oreo], student.cookies
  end
end