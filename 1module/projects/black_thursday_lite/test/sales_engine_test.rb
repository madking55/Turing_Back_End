require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def setup
    @sales_engine = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
    })
  end

  def test_it_exists
    assert_instance_of SalesEngine, @sales_engine
  end

  def test_it_creates_merchant_objects
    assert_equal Merchant, @sales_engine.merchants[0].class
  end

  def test_it_creates_item_objects
    skip
    assert_equal Item, @sales_engine.items[0].class
  end


end