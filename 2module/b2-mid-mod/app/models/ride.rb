class Ride < ApplicationRecord
  validates_presence_of :name, :rating, :park_id
  belongs_to :park

  def self.alphabetical_order
    order(:name)
  end
end