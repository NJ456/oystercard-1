require 'oystercard'

RSpec.describe Oystercard do
let(:oystercard) {Oystercard.new}
let(:entry_station) {double("dalston station")}
let(:exit_station) {double("highgate station")}
LIMIT = 90
MINIMUM_FARE = 1
#Let creates the object where theres subject it calls,
#oystercard = Oystercard.new
  describe '#balance' do
    it 'checks the default balance' do
      expect(oystercard.balance).to eq(0)

    end
  end

  describe '#top_up' do
    it 'adds money to the oystercard' do
      oystercard.top_up(5)
      expect(oystercard.balance).to eq(5)
    end

    it 'prevents user from topping up more than 90' do
      expect{oystercard.top_up(100)}.to raise_error("£#{ LIMIT } limit exceeded")
    end
  end

    it 'contains an empty array' do
      expect(oystercard.all_journeys).to eq([])
    end



  describe '#minimum fare' do
    it 'prevents journey if balance below minimum fare' do
      oystercard.balance
      expect{oystercard.minimum_fare}.to raise_error("please top-up, minimum fare £#{ MINIMUM_FARE }")
    end
  end
end
