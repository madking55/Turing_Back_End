class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(person, paid)
    @participants[person] = paid
  end

  def total_cost
   @participants.values.sum
  end

  def split
    total_cost / @participants.length
  end

  def owed
    money_owed = Hash.new
    @participants.each { |person, money| money_owed[person] = split - money }
    money_owed
  end

end