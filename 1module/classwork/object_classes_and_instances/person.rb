# frozen_string_literal: true
class Person
  attr_reader :name, :age, :race
  def initialize(name, age)
    @name = name
    @age = age
    @race = 'white'
  end

  def have_birthday
    @age += 1
  end
end
