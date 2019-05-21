require 'station'

describe Station do
    it 'creates an instance of station' do
        expect(Station.new(1, "Bum")).to be_an_instance_of(Station)
    end

    it 'contains a name' do 
        station = Station.new(1, "King's Cross")
        expect(station.name).to eq("King's Cross")
    end

    it 'contains a zone' do 
        station = Station.new(1, "King's Cross")
        expect(station.zone).to eq(1)
    end
end