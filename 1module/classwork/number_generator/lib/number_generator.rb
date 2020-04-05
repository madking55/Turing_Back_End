class NumberGenerator
  def initialize(max)
    @max = max
  end

  def number
    rand(@max)
  end

  def unknown_multiple_of(num)
    num * number
  end

  def generate_dogs
    dogs = []
    number.times do |num|
      dogs << "dog#{num}"
    end
    dogs
  end
end
