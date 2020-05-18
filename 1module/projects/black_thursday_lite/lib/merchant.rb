class Merchant
  attr_reader :id
  attr_accessor :name
  def initialize(merchant_params)
    @id = merchant_params[:id].to_i
    @name = merchant_params[:name]
  end
end