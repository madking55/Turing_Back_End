class PassengerFlightsController < ApplicationController
  def create
    flight = Flight.find_by_number(params[:flight_number])
    passenger = Passenger.find(params[:passenger_id])
    
    if flight.nil?
      redirect_to "/passengers/#{passenger.id}"
      flash[:error] = "Flight number can't be blank"
    elsif
      passenger.flight_numbers.include?(flight.number)
      redirect_to "/passengers/#{passenger.id}"
      flash[:error] = "This flight already exists"
    else
      PassengerFlight.create(flight: flight, passenger: passenger)
      redirect_to "/passengers/#{passenger.id}"
    end
  end
end