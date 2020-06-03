class MerchantCollection
  attr_reader :all

  def initialize(merchants)
    @all = merchants
  end

  def find(merchant_id)
    @all.find { |merchant| merchant.id == merchant_id }
  end

  def create(merchant_params)
    merchant_max_id = @all.max_by(&:id)
    new_merchant_id = merchant_max_id.id + 1
    merchant_params[:id] = new_merchant_id
    new_merchant = Merchant.new(merchant_params)
    @all << new_merchant
  end

  def update(merchant_params)
    if find(merchant_params[:id]) != nil
      find(merchant_params[:id]).name = merchant_params[:name]
    else
      "Merchant with id #{merchant_params[:id]} doesn't exists in collection"
    end
  end

  def destroy(merchant_id)
    @all.delete(find(merchant_id))
  end
end