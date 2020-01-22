# frozen_string_literal: true

require './unicorn'
require './power'

unicorn = Unicorn.new('Sparkle', 'rainbow')
power = Power.new('flying', 30)
p unicorn.magical_powers
p unicorn.add_power(power)
# p unicorn.magical_powers

require 'pry'; binding.pry
