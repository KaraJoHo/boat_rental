require './lib/boat'

RSpec.describe Boat do 
  let(:kayak) {Boat.new(:kayak, 20)}

  describe 'initialize' do 
    it 'exists and has a type and price' do 
      expect(kayak).to be_a(Boat)
      expect(kayak.type).to eq(:kayak)
      expect(kayak.price).to eq(20)
    end
  end
end