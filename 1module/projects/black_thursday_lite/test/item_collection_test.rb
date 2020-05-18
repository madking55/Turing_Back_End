require_relative 'test_helper'
require './lib/item_collection'
require './lib/item'
require './lib/merchant'
require './lib/sales_engine'

class ItemCollectionTest < Minitest::Test 

  def setup
    @item = Item.new({
      :id          => 1,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 1099,
      :merchant_id => 2
    })
    @item_collection = ItemCollection.new([@item])
    @sales_engine = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    @merchant_collection = @sales_engine.merchants
  end

  def test_it_exists
    assert_instance_of ItemCollection, @item_collection
  end

  def test_it_can_return_all_items
    assert_equal [@item], @item_collection.all
  end

  def test_it_can_returns_items_with_given_key_value_pair
    all_items_by_merchant_id = @item_collection.where({merchant_id: 2})
    assert_equal [@item], all_items_by_merchant_id

    all_pencils = @item_collection.where({name: 'Pencil'})
    assert_equal [@item], all_pencils

    all_fifty_cent_items = @item_collection.where({unit_price: 50})
    assert_equal [], all_fifty_cent_items
  end
end