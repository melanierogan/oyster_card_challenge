require './lib/Oystercard'

describe Oystercard do
    it 'gives you a balance of 0' do
        oystercard = Oystercard.new
        oystercard.balance
        expect(oystercard.balance).to eq(0)
    end
end
