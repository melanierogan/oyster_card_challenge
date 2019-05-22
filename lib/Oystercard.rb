

class Oystercard

    attr_reader :balance, :entry_station, :exit_station, :journey
    attr_accessor :limit

    DEFAULT = 90
    MIN = 1
    PENALTY = 6
    def initialize(limit = DEFAULT, min = MIN, penalty = PENALTY)
        @balance = 0
        @limit = limit
        @min = min
        @penalty = penalty
       
    end

    def top_up(num)
      @balance = @balance + num
      @balance > limit ? raise("maximum balance reached #{limit}!") : @balance
    end

    def in_journey?
      @entry_station != nil
    end
    
    def touch_in(station)
        if @balance < @min then raise("not enough funds")
        end
        @entry_station = station
        # Journey.new(@entry_station, ) can we create a journey, should we?
    end

    def touch_out(station)
        @exit_station = station
        if in_journey?
        deduct(journey.fare)
        # the above does not work because we need to create a journey in line 32
        end
        @entry_station = nil
    end

    private
    def deduct(num)
      @balance = @balance - num
    end
end
