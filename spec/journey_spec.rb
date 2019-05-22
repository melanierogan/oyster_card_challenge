require 'journey'
require 'Oystercard'


describe Journey do
  let(:oystercard){double(:oystercard, :min => 1, :penalty => 6, :touch_in => "King's Cross", :touch_out => "Shoreditch")}
  let(:journey){Journey.new("start_station")}
  let(:station){double(:station)}

  it 'gives an entry station on initialize' do
    expect(journey.start_station).to eq("start_station")
  end

  it 'gets the start of the journey' do
    expect(journey.beginning).to eq("start_station")
  end

  it 'gets the end of the journey' do
    end_station = oystercard.touch_out
    expect(end_station).to eq("Shoreditch")
  end

  it 'stores empty list of stations' do
    expect(journey.journeys).to eq([])
   end

   it 'stores the journey' do
    # journey.beginning
    start_station = oystercard.touch_in
    exit_station = oystercard.touch_out
    journey.journey_history
    expect(journey.journeys).to include("King's Cross" => "Shoreditch")
   end

   it 'has a fare method' do 
    expect(journey).to respond_to(:fare)
   end

   describe 'fare' do
    it 'charges minimum fare' do 
      @is_penalty = false
      expect(journey.fare).to eq(1)
    end

    # it 'has a penalty fare' do
    #   expect(journey.fare).to eq(6)
    # end

   end

end
