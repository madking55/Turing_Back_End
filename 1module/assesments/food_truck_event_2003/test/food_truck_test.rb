require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < Minitest::Test
  
  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  def test_it_exists
    assert_instance_of FoodTruck, @food_truck
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Pies", @food_truck.name
    assert_equal ({}), @food_truck.inventory
  end

  def test_it_returns_stock_items
    assert_equal 0, @food_truck.check_stock(@item1)
    @food_truck.stock(@item1, 30)
    assert_equal 30, @food_truck.check_stock(@item1)
    assert_equal ({ @item1 => 30 }), @food_truck.inventory
    
    @food_truck.stock(@item1, 25)
    assert_equal ({ @item1 => 55 }), @food_truck.inventory
    
    @food_truck.stock(@item2, 12)
    assert_equal ({ @item1 => 55, @item2 => 12 }), @food_truck.inventory
  end

  def test_it_returns_potential_revenue
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
    food_truck3 = FoodTruck.new("Palisade Peach Shack")  
    food_truck1.stock(item1, 35) 
    food_truck1.stock(item2, 7)  
    food_truck2.stock(item4, 50) 
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65) 

    assert_equal 148.75, food_truck1.potential_revenue
    assert_equal 345.00, food_truck2.potential_revenue
    assert_equal 243.75, food_truck3.potential_revenue

  end
end