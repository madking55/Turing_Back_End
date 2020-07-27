class MechanicRidesController < ApplicationController

  def create
    mechanic_id = params[:id]
    MechanicRide.create(ride_id: params[:ride_id], mechanic_id: mechanic_id)
    redirect_to "/mechanics/#{mechanic_id}"
  end
end