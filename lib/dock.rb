class Dock
  attr_reader :name, :max_rental_time, :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end



  def rent(boat_object, renter_object)
    rental_info = [boat_object, renter_object]
    rental_info.each_with_index do |boat, renter|
      boat = boat_object
      renter = renter_object
      @rental_log[boat] = renter
    end
  end
end
