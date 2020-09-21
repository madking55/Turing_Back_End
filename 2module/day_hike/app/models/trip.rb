class Trip < ApplicationRecord
  validates_presence_of :name
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_distance
    self.trails.sum(:length)
  end

  def average_distance
    self.trails.average(:length)
  end
end
