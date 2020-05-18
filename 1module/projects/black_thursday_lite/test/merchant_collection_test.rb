require_relative 'test_helper'
require './lib/merchant'
require './lib/merchant_collection'
require './lib/sales_engine'

class MerchantCollectionTest < Minitest::Test
  
  def setup 
    @merchant = Merchant.new({:id => 5, :name => "Turing School"})
    @merchant_collection = MerchantCollection.new([@merchant])
    @sales_engine = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
    })
  end

  def test_it_exists
    assert_instance_of MerchantCollection, @merchant_collection
  end

  def test_it_can_return_all_merchants
    assert_equal [@merchant], @merchant_collection.all
  end

  def test_it_can_return_merchant_with_matching_id
    assert_equal @merchant, @merchant_collection.find(5)
    assert_nil @merchant_collection.find(15)
  end

  def test_it_can_create_merchant
    @merchant_collection.create({name: 'Monster Merchant'})
    assert_equal 6,  @merchant_collection.all.last.id
    assert_equal 'Monster Merchant', @merchant_collection.all.last.name
  end

  def test_it_can_update_merchant_name
    @merchant_collection.update({id: 5, name: 'New Merchant Name'})
    assert_equal 'New Merchant Name', @merchant_collection.find(5).name

    expected = "Merchant with id 15 doesn't exists in collection"
    assert_equal expected, @merchant_collection.update({id: 15, name: 'New Merchant Name'})
  end

  def test_it_can_destroy_merchant
    @merchant_collection.destroy(5)
    assert_nil @merchant_collection.find(5)
  end
  
end