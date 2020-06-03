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

  def get_payees(activity, name)
    activity.participants.reject { |participant, owed| owed == activity.participants[name] }.keys
  end

  def detailed_breakout_for_participant(name)
    @activities.reduce([]) do |hash, activity|
      next(hash) unless activity.participants[name]
      payees = get_payees(activity, name)
      hash << { 
                  activity: activity.name, 
                  payees: payees,
                  amount: activity.owed[name] / payees.size
                }
    end
  end

  def all_participants
    all_participants = []
    @activities.each do |activity|
      activity.participants.each do |participant, cost|
        all_participants << participant unless all_participants.include?(participant)
      end
    end
    all_participants
  end

  def detailed_breakout
    all_participants.reduce({}) do |detailed_breakout, participant|
      detailed_breakout[participant] = detailed_breakout_for_participant(participant)
      detailed_breakout
    end
  end
end