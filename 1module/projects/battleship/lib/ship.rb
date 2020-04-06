class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    # ship should start off with health equal to it’s length
    @health = length 
  end

  def hit
    @health -= 1
  end

  def sunk?
    @health.zero?
  end
end