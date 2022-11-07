require 'rspec'
require './lib/boat'

RSpec.describe Boat do
  it 'exists and has attributes' do
    kayak = Boat.new(:kayak, 20)

    expect(kayak).to be_a(Boat)
    expect(kayak.type).to eq(:kayak)
    expect(kayak.price_per_hour).to eq(20)
  end

  describe '#hours_rented' do
    it 'shows the number of hours rented' do
      kayak = Boat.new(:kayak, 20)

      expect(kayak.hours_rented).to eq(0)
    end
  end

  describe '#add_hour' do
    it 'adds an hour to the hours rented' do
      kayak = Boat.new(:kayak, 20)

      expect(kayak.hours_rented).to eq(0)

      kayak.add_hour
      kayak.add_hour
      kayak.add_hour

      expect(kayak.hours_rented).to eq(3)
    end
  end
end
