# frozen_string_literal: true

# Create a person class with at least 2 attributes and 2 behaviors.  Call all
# person methods below the class so that they print their result to the
# terminal.

# YOUR CODE HERE

class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def can_drive?
    @age > 18
  end

  def can_read?
    @age >= 5
  end
end

person = Person.new('Jack', 25)
p person
p person.age
p person.can_drive?
p person.can_read?
