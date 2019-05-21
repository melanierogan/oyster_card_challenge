class Journey

  attr_reader :journeys

  def initialize
    @journeys = []
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_out(num, station)
      deduct(num)
      @exit_station = station
      @journey = { @entry_station => @exit_station }
      @entry_station = nil
  end

end
