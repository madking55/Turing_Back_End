class MechanicRide < ApplicationRecord
  validates_presence_of :ride_id, :mechanic_id
  belongs_to :ride
  belongs_to :mechanic
end