class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(person, paid)
    @participants[person] = paid
  end

  def total_cost
    @participants.values.sum
  end

end