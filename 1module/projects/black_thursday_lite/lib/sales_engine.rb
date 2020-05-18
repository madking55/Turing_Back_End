require 'csv'
require './lib/merchant'
require './lib/item.rb'
require './lib/merchant_collection.rb'
require './lib/item_collection.rb'

class SalesEngine
  attr_reader :items, :merchants

  def initialize(items, merchants)
    @items = items
    @merchants = merchants
  end

  def self.from_csv(sales_params)
    merchant_collection = []
    CSV.foreach(sales_params[:merchants], headers: true, header_converters: :symbol) do |row|
      merchant_params = { id: row[:id], name: row[:name] }
      merchant_collection << Merchant.new(merchant_params)
    end
    item_collection = []
    CSV.foreach(sales_params[:items], headers: true, header_converters: :symbol) do |row|
      item_params = { 
        id: row[:id],
        name: row[:name],
        description: row[:description],
        unit_price: row[:unit_price],
        merchant_id: row[:merchant_id]
      }
      item_collection << Item.new(item_params)
    end
    SalesEngine.new(item_collection, merchant_collection)
  end

  def merchant_collection(merchants)
    MerchantCollection.new(merchants)
  end

  def item_collection(items)
    ItemCollection.new(items)
  end

end