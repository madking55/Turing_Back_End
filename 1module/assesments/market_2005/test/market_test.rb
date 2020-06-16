require_relative 'test_helper'
require './lib/market'
require './lib/item'
require './lib/vendor'
require 'date'
require 'mocha/minitest'

class MarketTest < Minitest::Test

  def setup
    @market = Market.new("South Pearl Street Farmers Market") 
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")  
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  def setup_market
    @vendor1.stock(@item1, 35) 
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65) 

    @market.add_vendor(@vendor1) 
    @market.add_vendor(@vendor2) 
    @market.add_vendor(@vendor3)
  end

  def test_it_exists
    assert_instance_of Market, @market
  end

  def test_it_has_attributes
    assert_equal "South Pearl Street Farmers Market", @market.name
    assert_equal [], @market.vendors
  end

  def test_it_can_add_vendor
    setup_market
    assert_equal [@vendor1, @vendor2, @vendor3], @market.vendors
  end

  def test_it_returns_vendor_names
    setup_market
    expected = ["Rocky Mountain Fresh", 
                "Ba-Nom-a-Nom", 
                "Palisade Peach Shack"]
    assert_equal expected, @market.vendor_names            
  end

  def test_it_returns_vendors_that_sell_item
    setup_market
    assert_equal [@vendor1, @vendor3], @market.vendors_that_sell(@item1)
    assert_equal [@vendor2], @market.vendors_that_sell(@item4)
  end

  def test_it_returns_total_inventory
    setup_market
    @vendor3.stock(@item3, 10)

    expected = {
       @item1 => { quantity: 100, vendors: [ @vendor1, @vendor3] }, 
       @item2 => { quantity: 7, vendors: [ @vendor1] }, 
       @item4 => { quantity: 50, vendors: [ @vendor2] },
       @item3 => { quantity: 35, vendors: [ @vendor2, @vendor3]} 
      }
    assert_equal expected, @market.total_inventory
  end

  def test_it_returns_sorted_item_list
    setup_market
    expected = ["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"]

    assert_equal expected, @market.sorted_item_list
  end

  def test_it_returns_overstocked_items
    setup_market
    assert_equal [@item1], @market.overstocked_items
  end

  def test_it_can_sell_items
    setup_market
    @item5 = Item.new({name: 'Onion', price: '$0.25'})

    refute @market.sell(@item1, 200)
    refute @market.sell(@item5, 1)
    assert @market.sell(@item4, 5)

    assert_equal 45, @vendor2.check_stock(@item4)
    assert @market.sell(@item1, 40)
    assert_equal 0, @vendor1.check_stock(@item1)
    assert_equal 60, @vendor3.check_stock(@item1)
  end

  def test_it_return_date
    @market.stubs(:date).returns("24/02/2020")
    assert_equal "24/02/2020", @market.date
  end

end