class House

  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price.delete_prefix('$').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500_000
  end

  def rooms_from_category(category)
    @rooms.select { |room| room.category == category }
  end

  def area 
    @rooms.reduce(0) { |sum, room| sum + room.area }
  end

  def details
   { "price" => @price, "address" => @address }
  end

  def price_per_square_foot
    (@price / (area * 1.0)).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by { |room| room.area }.reverse
  end


  def rooms_by_category
    @rooms.group_by { |room| room.category }
  end
end