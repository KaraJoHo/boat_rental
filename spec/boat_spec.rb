require 'rspec'
require './lib/boat'

RSpec.describe Boat do
  it 'exists and has attributes' do
    kayak = Boat.new(:kayak, 20)

    expect(kayak).to be_a(Boat)
    expect(kayak.type).to eq(:kayak)
    expect(kayak.price_per_hour).to eq(20)
  end
end
