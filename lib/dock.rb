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
    charge_log = {}
    charge_log[:card_number] = @rental_log[boat].credit_card_number
    charge_log[:amount] = calculate_amount(boat)
    charge_log
  end

  def calculate_amount(boat)
    if boat.hours_rented > @max_rental_time 
      boat.price_per_hour * @max_rental_time 
    else 
      boat.price_per_hour * boat.hours_rented
    end
  end

  def log_hour 
    @rental_log.each do |boat, renter| 
      boat.add_hour
    end
  end
end