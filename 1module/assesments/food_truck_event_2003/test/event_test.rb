require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'
require './lib/event'
require 'date'
require 'mocha/minitest'

class EventTest < Minitest::Test

  def setup
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")  
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")  
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  def setup_event
    @food_truck1.stock(@item1, 35)   
    @food_truck1.stock(@item2, 7) 
    @food_truck2.stock(@item4, 50)  
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65) 
    @food_truck3.stock(@item3, 10)   
    @event.add_food_truck(@food_truck1) 
    @event.add_food_truck(@food_truck2) 
    @event.add_food_truck(@food_truck3) 
  end

  def test_it_exists
    assert_instance_of Event, @event
  end

  def test_it_has_attributes
    assert_equal "South Pearl Street Farmers Market", @event.name
    assert_equal [], @event.food_trucks
  end

  def test_it_adds_food_trucks
    setup_event
    assert_equal [@food_truck1, @food_truck2, @food_truck3], @event.food_trucks
  end

  def test_it_return_food_truck_names
    setup_event
    expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, @event.food_truck_names
  end

  def test_it_returns_trucks_that_sell_item
    setup_event
    assert_equal [@food_truck1, @food_truck3], @event.food_trucks_that_sell(@item1)
    assert_equal [@food_truck2], @event.food_trucks_that_sell(@item4)
  end

  def test_it_returns_sorted_item_list
    setup_event
    expected = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]
    assert_equal expected, @event.sorted_item_list
  end

  def test_it_returns_total_inventory
    setup_event
    expected = {
      @item1 => {
        quantity: 100,
        food_trucks: [@food_truck1, @food_truck3]
      },
      @item2 => {
        quantity: 7,
        food_trucks: [@food_truck1]
      },
      @item3 => {
        quantity: 35,
        food_trucks: [@food_truck2, @food_truck3]
      },
      @item4 => {
        quantity: 50,
        food_trucks: [@food_truck2]
      }
    }

    assert_equal expected, @event.total_inventory
  end

  def test_it_returns_overstocked_items
    setup_event
    assert_equal [@item1], @event.overstocked_items
  end

  def test_it_can_sell_items
    @item5 = Item.new({name: 'Onion Pie', price: '$25.00'})

    @food_truck1.stock(@item1, 35)   
    @food_truck1.stock(@item2, 7) 
    @food_truck2.stock(@item4, 50)  
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65) 

    @event.add_food_truck(@food_truck1) 
    @event.add_food_truck(@food_truck2) 
    @event.add_food_truck(@food_truck3) 

    refute @event.sell(@item1, 200)
    refute @event.sell(@item5, 1)
    assert @event.sell(@item4, 5)
    assert_equal 45, @food_truck2.check_stock(@item4)
    assert @event.sell(@item1, 40)
    assert_equal 0, @food_truck1.check_stock(@item1)

  end

  def test_it_has_date
    @event.stubs(:date).returns("01/06/2020")
    assert_equal "01/06/2020", @event.date
  end

end
