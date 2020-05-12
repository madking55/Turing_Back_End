class Motor
  def initialize
    @running = false
  end

  def start
    @running = true
  end

  def running?
    @running
  end
end