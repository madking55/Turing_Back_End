class Reunion
  attr_reader :name, :activities
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.reduce(0) { |sum, activity| sum += activity.total_cost }
  end

  def breakout
    hash = Hash.new(0)
    @activities.each do |activity| 
      activity.owed.each { |key, value| hash[key] += value }
    end
    hash
  end

  def summary
    breakout.map { |person, owed| "#{person}: #{owed}\n" }.join.chomp
  end

end