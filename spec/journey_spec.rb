require 'journey'

describe Journey do
 let(:journey){Journey.new}

  it 'stores empty list of stations' do
   expect(journey.journeys).to eq([])
  end

  it 'tells you you are finished when you touch out' do
   subject.touch_out(0, station)
   expect(journey.in_journey?).to be(false)
  end

  it 'stores the journey (entry and exit)' do
   journey.touch_in(1, "Farringdon")
   journey.touch_out(1, "Kings Cross")
   expect(journey.journey).to include("Farringdon" => "Kings Cross")
  end

  it 'stores empty list of stations' do
   expect(journey.journeys).to eq([])
  end

  it 'stores the journey (entry and exit)' do
   journey.touch_in(1, "Farringdon")
   journey.touch_out(1, "Kings Cross")
   expect(journey.journey).to include("Farringdon" => "Kings Cross")
  end


end
