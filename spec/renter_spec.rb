require './lib/renter'

RSpec.describe Renter do 
  let(:renter) {Renter.new("Patrick Star", "4242424242424242")}

  describe '#initialize' do 
    it 'exists and has a name and credit card number' do 
      expect(renter).to be_a(Renter)
      expect(renter.name).to eq("Patrick Star")
      expect(renter.credit_card_number).to eq("4242424242424242")
    end
  end
end