require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/number_generator'

class NumberGeneratorTest < Minitest::Test

  def test_it_exists
    generator = NumberGenerator.new(5)
    assert_instance_of NumberGenerator, generator
  end
  
  def test_it_generates_random_number
    generator = NumberGenerator.new(5)
    assert generator.number < 5
  end

  def test_it_multiplies_numbers
  end

end
