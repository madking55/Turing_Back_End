require 'minitest/autorun'
require 'minitest/pride'
require './lib/paint'

class PaintTest < Minitest::Test
  def test_it_exists
    paint1 = Paint.new("Alizarin Crimson")
    paint2 = Paint.new("Van Dyke Brown", 65)

    assert_instance_of Paint, paint1
    assert_instance_of Paint, paint2
  end

  def test_it_has_attributes
    paint1 = Paint.new("Alizarin Crimson")
    paint2 = Paint.new("Van Dyke Brown", 25)

    assert_equal "Alizarin Crimson", paint1.color
    assert_equal 0, paint1.amount
    assert_equal 65, paint2.amount
  end
end
