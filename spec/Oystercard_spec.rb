require './lib/Oystercard'

describe Oystercard do
    it 'gives you a balance of 0' do
        oystercard = Oystercard.new
        oystercard.balance
        expect(oystercard.balance).to eq(0)
    end
    it 'can deduct fare from oystercard' do
      oystercard = Oystercard.new
      expect(oystercard.deduct(10)).to eq(-10)
    end


end

describe "top_up" do
    it 'can be topped up' do
        oystercard = Oystercard.new
        oystercard.top_up(50)
        expect(oystercard.top_up(50)).to eq(50)
      end

      it 'throws an error when 90 quid limit is reached' do
          oystercard = Oystercard.new
          expect{oystercard.top_up(91)}.to raise_error("maximum balance reached #{Oystercard::DEFAULT}!")
      end
end
