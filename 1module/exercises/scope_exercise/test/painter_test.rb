require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/painter'
require './lib/paint'

class PainterTest < Minitest::Test
  def test_it_exists
    the_painters_name = "Bob Ross"
    painter = Painter.new(the_painters_name)
    assert_instance_of Painter, painter
  end

  def test_it_has_a_name1
    the_painters_name = "Bob Ross"
    painter = Painter.new(the_painters_name)
    assert_equal "Bob Ross", painter.name
  end

  def test_it_has_a_name2
    painter = Painter.new("Bob Ross")
    assert_equal "Bob Ross", painter.name
  end

  def test_it_has_a_name3
    bob_ross = Painter.new("Bob Ross")
    assert_equal "Bob Ross", bob_ross.name
  end

  def test_it_can_give_greeting
    painter = Painter.new("Bob Ross")
    assert_equal "Hello, I'm Bob Ross", painter.greeting
  end

  def test_it_can_give_greeting_again
    painter = Painter.new("Bob Ross")
    assert_equal "Hello, I'm Bob Ross", painter.greeting
  end

  def test_it_starts_with_no_paint
    painter = Painter.new("Bob Ross")
    assert_equal [], painter.get_paints
  end

  def test_it_can_add_all_paints
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_all_paints(paint_1, paint_2)
    assert_equal [paint_1, paint_2], painter.get_paints
  end

  def test_it_can_add_paints
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_paint(paint_1)
    painter.add_paint(paint_2)
    assert_equal [paint_1, paint_2], painter.get_paints
  end

  def test_it_can_add_paints_again
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_paint(paint_1)
    painter.add_paint(paint_2)
    assert_equal [paint_1, paint_2], painter.get_paints
  end

  def test_it_can_add_paints_third_try
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_paint(paint_1)
    painter.add_paint(paint_2)
    assert_equal [paint_1, paint_2], painter.get_paints
  end

  def test_it_can_get_paint_names
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_paint(paint_1)
    painter.add_paint(paint_2)
    expected = ["Alizarin Crimson", "Van Dyke Brown"]
    assert_equal expected, painter.paint_names
  end
end
