class Student < ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.average_age
    average(:age).round(1)
  end

  def self.alphabetical_order
    order(:name)
  end
end
