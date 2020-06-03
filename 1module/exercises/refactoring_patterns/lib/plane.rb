require './lib/engine'

class Plane
  attr_reader :engines

  def initialize
    @engines = Array.new(2) { Engine.new }
  end

  def body_weight
    1000
  end

  def start
    engines.each{|e| e.start}
  end

  def weight
    engines_weight = @engines.map { |e| e.engine_weight }.sum
    body_weight + engines_weight
  end
end
