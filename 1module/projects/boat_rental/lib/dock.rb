class Dock
  attr_reader :name, :max_rental_time, :rental_log
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    charge_hash = {
      :card_number => @rental_log[boat].credit_card_number,
      :amount => boat.price_per_hour * rent_time_to_charge(boat)
    }
  end

  def rent_time_to_charge(boat)
    if boat.hours_rented < @max_rental_time
      return boat.hours_rented
    else
      return max_rental_time
    end
  end
end