class ChangeRideMechanicsToMechanicRides < ActiveRecord::Migration[5.1]
  def change
    rename_table :ride_mechanics, :mechanic_rides
  end
end
