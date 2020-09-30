class Bachelorette <ApplicationRecord
  has_many :contestants

  def contestants_avg_age
    contestants.average(:age)
  end

  def contestants_unique_hometowns
    contestants.select(:hometown).distinct.pluck(:hometown)
  end
end
