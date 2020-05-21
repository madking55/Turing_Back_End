class Dock
  attr_reader :name, :max_rental_time, :rental_log
  attr_accessor :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @revenue = 0
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
   {
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

  def log_hour
    @rental_log.each { |boat, renter| boat.add_hour }
  end

  def return(boat)
    @revenue += charge(boat)[:amount]
    @rental_log.delete(boat)
  end


end