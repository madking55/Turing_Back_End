class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |truck| truck.inventory[item] != 0 }
  end

  def total_inventory
    total_inventory = Hash.new { |hash, key| hash[key] = { quantity: 0, food_trucks: [] } }
    @food_trucks.each do |truck|
      truck.inventory.each do |item, q|
        total_inventory[item][:quantity] += q
        total_inventory[item][:food_trucks] << truck
      end
    end
    total_inventory
  end

  def sorted_item_list
    total_inventory.keys.map(&:name).sort
  end

  def overstocked_items
    overstocked_items = total_inventory.select do |item, hash| 
     hash[:quantity] > 50 && hash[:food_trucks].size > 1
    end
    overstocked_items.keys
  end
end