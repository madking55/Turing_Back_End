# frozen_string_literal: true

class Unicorn
  attr_reader :name, :color, :magical_powers

  def initialize(name, color)
    @name = name
    @color = color
    @magical_powers = []
  end

  def add_power(power)
    @magical_powers << power
  end
end
