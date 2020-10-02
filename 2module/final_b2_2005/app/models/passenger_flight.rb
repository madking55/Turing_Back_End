class PassengerFlight < ApplicationRecord
  validates_presence_of :passenger_id
  validates_presence_of :flight_id
  belongs_to :passenger
  belongs_to :flight
end