class PassengerFlightsController < ApplicationController
  def create
    flight = Flight.find_by_number(params[:flight_number])
    PassengerFlight.create!(flight_id: flight.id, passenger_id: params[:passenger_id])
    redirect_to passenger_path(params[:passenger_id])
  end
end