class Journey

  attr_reader :start_station

  def initialize(start_station, oystercard)
    @start_station = start_station
    @oystercard = oystercard
  end

  # def in_journey?
  #   @entry_station != nil
  # end

  def end_station
    @oystercard.exit_station
  end


end
