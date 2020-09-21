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

  def longest_trail
    self.trails.order(:length).last    
  end

  def shortest_trail
    self.trails.order(:length).first
  end
end
