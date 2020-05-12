class Engine
  def core_weight
    250
  end

  def propeller_weight
    50
  end

  def engine_weight
    core_weight + propeller_weight
  end

  def start
    @running = true
  end

  def running?
    !!@running
  end
end
