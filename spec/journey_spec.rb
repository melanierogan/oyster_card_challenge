require 'journey'
require 'Oystercard'


describe Journey do
  let(:oystercard){double(:oystercard, :min => 1, :penalty => 6, :entry_station => "King's Cross", :exit_station => "Shoreditch")}
  let(:journey){Journey.new("start_station", oystercard)}
  let(:station){double(:station)}

  it 'gives an entry station on initialize' do
    expect(journey.start_station).to eq("start_station")
  end

  it 'gets the start of the journey' do
    expect(journey.beginning).to eq("start_station")
  end

  it 'gets the end of the journey' do
    expect(journey.end_station).to eq("Shoreditch")
  end

  it 'stores empty list of stations' do
    expect(journey.journeys).to eq([])
   end

   it 'stores the journey' do
    # journey.beginning
    journey.journey_history
    expect(journey.journeys).to include("start_station" => "Shoreditch")
   end

   it 'has a fare method' do 
    expect(journey).to respond_to(:fare)
   end

   describe 'fare' do
    it 'has a minimum fare' do 
      expect(journey.fare(false)).to eq(1)
    end

    it 'has a penalty fare' do
      expect(journey.fare(true)).to eq(6)
    end

   end

end
