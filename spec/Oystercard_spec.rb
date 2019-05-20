require './lib/Oystercard'

describe Oystercard do

    let (:oystercard) { Oystercard.new }

    it 'gives you a balance of 0' do
        oystercard.balance
        expect(oystercard.balance).to eq(0)
    end
    it 'can deduct fare from oystercard' do
      expect(oystercard.deduct(10)).to eq(-10)
    end

    it 'tells you you are in journey when card is in use' do
       expect(subject.in_journey).to be true
    end

    it 'tells you you are in journey when you touch in' do
        expect(subject.touch_in).to be(true)
     end

     it 'tells you you are finished when you touch out' do
        expect(subject.touch_out).to be(false)
     end

end

describe "top_up" do
    let (:oystercard) { Oystercard.new }

    it 'can be topped up' do
        oystercard.top_up(50)
        expect(oystercard.top_up(50)).to eq(50)
      end

      it 'throws an error when 90 quid limit is reached' do
          expect{oystercard.top_up(91)}.to raise_error("maximum balance reached #{Oystercard::DEFAULT}!")
      end
end
