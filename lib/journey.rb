class Journey

  attr_reader :start_station, :journeys

  def initialize(start_station, oystercard)
    @start_station = start_station
    @oystercard = oystercard
    @journeys = []
  end

  def end_station
    @oystercard.exit_station
  end

  def beginning 
    @start_station
  end

  def journey_history
    # @journey = { @entry_station => @exit_station }
    @journeys << { @start_station => @oystercard.exit_station }
  end

  def fare(penalty)
    if penalty == false 
      @oystercard.min
    else
      @oystercard.penalty
    end
  end

end
