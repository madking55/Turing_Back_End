class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    average(:age)
  end

  def missions_alphabetically
    if missions.empty?
      "No Missions yet"
    else
      missions.order(:title).pluck(:title).join(", ")
    end
  end

end
