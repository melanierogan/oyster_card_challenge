require './lib/Oystercard'

describe Oystercard do
    it 'gives you a balance of 0' do
        oystercard = Oystercard.new
        oystercard.balance
        expect(oystercard.balance).to eq(0)
    end

    it 'can be topped up' do
      oystercard = Oystercard.new
      oystercard.top_up(50)
      expect(oystercard.top_up(50)).to eq(50)
    end
end
