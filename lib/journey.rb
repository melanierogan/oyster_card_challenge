class Journey

  attr_reader :start_station, :journeys, :min, :is_penalty


  MIN = 1
  PENALTY = 6

  def initialize(start_station, min = MIN, penalty = PENALTY)
    @start_station = start_station
    @journeys = []
    @min = min
    @penalty = penalty
    @is_penalty = false
  end

  def end_station
    @exit_station
  end

  def beginning 
    @start_station
  end

  def make_penalty
    @is_penalty = true
  end

  def journey_history
    # @journey = { @entry_station => @exit_station }
    @journeys << { @start_station => @exit_station }
  end

  def fare
    if @is_penalty == false 
      @min
    else
      @penalty
    end
  end

end
