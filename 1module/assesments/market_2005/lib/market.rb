class Market 

attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map(&:name)
  end

  def vendors_that_sell(item)
    @vendors.select {|vendor| !vendor.check_stock(item).zero?}
  end

  def total_inventory
    total_inventory = Hash.new { |hash, key| hash[key] = { quantity: 0, vendors: [] }}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, q|
        total_inventory[item][:quantity] += q
        total_inventory[item][:vendors] << vendor
      end
    end
    total_inventory
  end

  def overstocked_items
  end

  def sorted_item_list
    
  end

end