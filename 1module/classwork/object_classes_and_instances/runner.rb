# frozen_string_literal: true

require './unicorn'
require './person'
# require './power'

unicorn_1  = Unicorn.new("Sparkle", "rainbow")
unicorn_2   = Unicorn.new("", "white")
power = Power.new('flying', 3)

p unicorn_1.magical_powers
unicorn_1.add_power(power)
p unicorn_1.magical_powers

person_1 = Person.new('Alex', 34)
person_2 = Person.new('Peter', 14)
p person_2.age
person_2.have_birthday
p person_2.age

# require 'pry'; binding.pry

