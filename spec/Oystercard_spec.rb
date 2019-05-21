require './lib/Oystercard'

describe Oystercard do

    let (:oystercard) { Oystercard.new }
    let (:station) { double(:station) }

    it 'gives you a balance of 0' do
        oystercard.balance
        expect(oystercard.balance).to eq(0)
    end
    # it 'can deduct fare from oystercard' do
    #   expect(oystercard.deduct(10)).to eq(-10)
    # end
    #
    # it 'tells you you are in journey when card is in use' do
    #   oystercard.touch_in(1, station)
    #   expect(oystercard.in_journey?).to be true
    # end

    # it 'tells you you are in journey when you touch in' do
    #     expect(subject.touch_in(Oystercard::MIN, station)).to be(true)
    #  end

     # it 'tells you you are finished when you touch out' do
     #  subject.touch_out(0, station)
     #  expect(oystercard.in_journey?).to be(false)
     # end

     it 'throws an error when below 1 pound' do
       expect{oystercard.touch_in(0,station)}.to raise_error("not enough funds")
     end

     it 'deducts from balance on touch out' do
        oystercard.top_up(6)
        # oystercard.status = true
        oystercard.touch_out(4, station)
        expect(oystercard.balance).to eq(2)
     end

     it 'stores station at touch in' do
      oystercard.top_up(10)
      expect(oystercard).to respond_to(:touch_in).with(2).arguments
     end

     it 'stores empty list of stations' do
      expect(oystercard.journeys).to eq([])
     end
#
#      it 'stores the journey (entry and exit)' do
#       oystercard.touch_in(1, "Farringdon")
#       oystercard.touch_out(1, "Kings Cross")
#       expect(oystercard.journey).to include("Farringdon" => "Kings Cross")
#      end
 end

describe "top_up" do
    let (:oystercard) { Oystercard.new }

    it 'can be topped up' do
        expect(oystercard.top_up(50)).to eq(50)
      end

      it 'throws an error when 90 quid limit is reached' do
          expect{oystercard.top_up(91)}.to raise_error("maximum balance reached #{Oystercard::DEFAULT}!")
      end
end
