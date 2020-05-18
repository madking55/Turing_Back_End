class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id
  def initialize(item_params)
    @id = item_params[:id]
    @name = item_params[:name]
    @description = item_params[:description]
    @unit_price = item_params[:unit_price]
    @merchant_id = item_params[:merchant_id]
  end
end