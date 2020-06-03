require './lib/motor'
class Boat
  def initialize
    @motors = Array.new(2) { Motor.new }
  end

  def start
   @motors.each { |m| m.start }
  end

  def running?
    @motors.all? { |m| m.running? }
  end
end
