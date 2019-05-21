require 'journey'
require 'Oystercard'


describe Journey do
  let(:oystercard){double(:oystercard, :exit_station => "Shoreditch")}
  let(:journey){Journey.new("start_station", oystercard)}
  let(:station){double(:station)}


  it 'updates in journey to be false when you touch out' do
   journey.touch_out(0, station)
   expect(journey.in_journey?).to be(false)
  end

  it 'stores the journey (entry and exit)' do
   journey.touch_in(1, "Farringdon")
   journey.touch_out(1, "Kings Cross")
   expect(journey.journey).to include("Farringdon" => "Kings Cross")
  end

  it 'gives an entry station on initialize' do
    journey = Journey.new("King's Cross", oystercard)
    expect(journey.start_station).to eq("King's Cross")
  end

  it 'gives an end station when card touches out' do
      oystercard = Oystercard.new
      oystercard.touch_out(1, "Shoreditch")
    expect(journey.end_station).to eq("Shoreditch")
  end

end
