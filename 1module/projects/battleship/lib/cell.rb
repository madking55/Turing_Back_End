class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def ship
    @ship
  end

  def empty?
    ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    ship.hit unless empty? 
    @fired_upon = true
  end

  def render(arg = false)
    return "S" if arg == true && !fired_upon?
    return "." unless fired_upon?
    return "M" if fired_upon? && empty? 
    return "X" if fired_upon? && !empty? && ship.sunk?
    return "H" if fired_upon? && !empty?
  end

end