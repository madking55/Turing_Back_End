# frozen_string_literal: true

# Add the following methods to this burrito class and call the methods below
# the class:
# 1. add_topping
# 2. remove_topping
# 3. change_protein

class Burrito
  attr_reader :protein, :base, :toppings
  attr_writer :protein

  def initialize(protein, base, toppings)
    @protein  = protein
    @base     = base
    @toppings = toppings
  end

  def add_topping(topping)
    @topping = topping
    @toppings << @topping
  end

  def remove_topping(topping)
    @topping = topping
    @toppings.delete(@topping)
  end

  def change_protein(new_protein)
    @new_protein = new_protein
    @protein = @new_protein
  end
end

dinner = Burrito.new('Beans', 'Rice', %w[cheese salsa guacamole])
p dinner.protein
p dinner.change_protein('Meat')
p dinner.protein
p dinner.base
p dinner.toppings
p dinner.add_topping('ketchup')
p dinner.remove_topping('salsa')
p dinner.toppings
