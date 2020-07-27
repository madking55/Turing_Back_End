class Ride < ApplicationRecord
  validates_presence_of :name, :rating, :park_id
  belongs_to :park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.alphabetical_order
    order(:name)
  end

  def self.average_rating
    average(:rating)
  end
end