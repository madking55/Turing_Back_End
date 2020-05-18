require 'csv'

class ItemCollection

  attr_reader :all

  def initialize(items)
    @all = items
  end

  def where(key_value_pair)
    key = key_value_pair.keys.first
    value = key_value_pair.values.first
    @all.find_all { |item| item.send(key) == value }
  end
end