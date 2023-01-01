require './lib/boat'

RSpec.describe Boat do 
  let(:kayak) {Boat.new(:kayak, 20)}

  describe 'initialize' do 
    it 'exists and has a type and price' do 
      expect(kayak).to be_a(Boat)
      expect(kayak.type).to eq(:kayak)
      expect(kayak.price_per_hour).to eq(20)
    end
  end
  
  describe '#hours_rented/add_hour' do 
    it 'starts with 0 and adds hours rented' do 
      expect(kayak.hours_rented).to eq(0)

      kayak.add_hour 
      kayak.add_hour
      kayak.add_hour 

      expect(kayak.hours_rented).to eq(3)
    end
  end
end