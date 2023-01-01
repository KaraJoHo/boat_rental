require './lib/dock'
require './lib/boat'
require './lib/renter'

RSpec.describe Dock do 
  let(:dock) {Dock.new("The Rowing Dock", 3)}

  let(:kayak_1) {Boat.new(:kayak, 20)}
  let(:kayak_2) {Boat.new(:kayak, 20)}
  let(:sup_1) {Boat.new(:standup_paddle_board, 15)}

  let(:canoe) {Boat.new(:canoe, 25)}
  let(:sup_2) {Boat.new(:standup_paddle_board, 15)}

  let(:patrick) {Renter.new("Patrick Star", "4242424242424242")}
  let(:eugene) {Renter.new("Eugene Crabs", "1313131313131313")}

  describe '#initialize' do 
    it 'exists and has a name and max rental time' do 
      expect(dock).to be_a(Dock)
      expect(dock.name).to eq("The Rowing Dock")
      expect(dock.max_rental_time).to eq(3)
    end
  end

  describe '#rent/rental_log' do 
    it 'can rent boats to renter and log the boats rented by the renter' do 
      expect(dock.rental_log).to eq({})

      dock.rent(kayak_1, patrick)    
      dock.rent(kayak_2, patrick)    
      dock.rent(sup_1, eugene)  

      expected_hash = {
                        kayak_1 => patrick, 
                        kayak_2 => patrick, 
                        sup_1 => eugene

      }

      expect(dock.rental_log).to eq(expected_hash)

    end
  end

  describe '#charge' do 
    it 'takes a boat and returns a hash with credit card number/renter kv pair and amount kv pair' do 
      dock.rent(kayak_1, patrick)    
      dock.rent(kayak_2, patrick)    
      dock.rent(sup_1, eugene) 

      kayak_1.add_hour
      kayak_1.add_hour

      expect(dock.charge(kayak_1)).to eq({:card_number => "4242424242424242", :amount => 40})
      expect(dock.calculate_amount(kayak_1)).to eq(40)

      sup_1.add_hour
      sup_1.add_hour
      sup_1.add_hour
      # Any hours past the max rental time should not count
      sup_1.add_hour
      sup_1.add_hour

      expect(dock.charge(sup_1)).to eq({:card_number => "1313131313131313", :amount => 45})
    end
  end

  describe '#log_hour' do 
    it 'logs another hour for the boats in the dock' do 
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      expect(kayak_1.hours_rented).to eq(0)
      expect(kayak_2.hours_rented).to eq(0)

      # kayak_1 and kayak_2 are rented an additional hour
      dock.log_hour
      expect(kayak_1.hours_rented).to eq(1)
      expect(kayak_2.hours_rented).to eq(1)

      dock.rent(canoe, patrick)

      # kayak_1, kayak_2, and canoe are rented an additional hour
      dock.log_hour

      expect(kayak_1.hours_rented).to eq(2)
      expect(kayak_2.hours_rented).to eq(2)
      expect(canoe.hours_rented).to eq(1)
    end
  end

  describe '#revenue and return' do 
    it 'once all boats are returned, the revenue can be calculated' do 
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)

      dock.log_hour

      dock.rent(canoe, patrick)

      dock.log_hour

      expect(dock.revenue).to eq(0)

      dock.return(kayak_1)
      dock.return(kayak_2)
      dock.return(canoe)

      expect(dock.revenue).to eq(105)

      

    end
  end

end