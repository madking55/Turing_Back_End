class Employee
  attr_reader :name, :id
  def initialize(name, id)
    @name = name
    @id = id
  end

  def total_compensation
    base_salary + bonus
  end

  def benefits
    [:sick_leave]
  end

  def base_salary
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def bonus
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end
end