require 'csv'


class ItemCollection

  attr_reader :all

  def initialize(items)
    @all = items
  end

  def where(merchant_id)
    @all.select { |item| item.merchant_id == merchant_id }
  end
end