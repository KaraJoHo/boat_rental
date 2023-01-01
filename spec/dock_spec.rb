require './lib/dock'
require './lib/boat'
require './lib/renter'

RSpec.describe Dock do 
  let(:dock) {Dock.new("The Rowing Dock", 3)}

  let(:kayak_1) {Boat.new(:kayak, 20)}
  let(:kayak_2) {Boat.new(:kayak, 20)}
  let(:sup_1) {Boat.new(:standup_paddle_board, 15)}

  let(:patrick) {Renter.new("Patrick Star", "4242424242424242")}
  let(:eugene) {Renter.new("Eugene Crabs", "1313131313131313")}

  describe '#initialize' do 
    it 'exists and has a name and max rental time' do 
      expect(dock).to be_a(Dock)
      expect(dock.name).to eq("The Rowing Dock")
      expect(dock.max_rental_time).to eq(3)
    end
  end

end