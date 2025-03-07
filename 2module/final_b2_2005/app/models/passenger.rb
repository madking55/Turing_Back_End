class Passenger < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights

  def flight_numbers
    flights.select(:number).pluck(:number)
  end
end