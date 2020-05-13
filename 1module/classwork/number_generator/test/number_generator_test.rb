require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/number_generator'

class NumberGeneratorTest < Minitest::Test
# Using stubs and/or mocks, write the tests to confirm the functionality that exists in ./lib/number_generator.rb

  def test_it_exists
    ng = NumberGenerator.new(9)
    assert_instance_of NumberGenerator, ng
  end

  def test_it_has_max_argument
    ng = NumberGenerator.new(9)
    ng.stubs(:max).returns(9)
    assert_equal 9, ng.max
  end

  def test_it_generates_random_number
    ng = NumberGenerator.new(9)
    ng.stubs(:max).returns(9)
    assert ng.number <= ng.max
  end

  def test_it_can_multiply
    ng = NumberGenerator.new(5)
    ng.stubs(:max).returns(5)
    ng.unknown_multiple_of(3)
    expected = ng.max * 3
    assert expected <= ng.max * 3
  end

  def test_it_generates_dogs
    ng = NumberGenerator.new(3)
    ng.stubs(:number).returns(5)

    assert_equal 5, ng.generate_dogs.length
  end
end
