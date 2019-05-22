
class Oystercard

    attr_reader :balance, :entry_station, :exit_station, :journey
    attr_accessor :limit

    DEFAULT = 90

    def initialize(limit = DEFAULT, journey = Journey.new(start_station = nil))
        @balance = 0
        @limit = limit
        @journey = journey

       
    end

    def top_up(num)
      @balance = @balance + num
      @balance > limit ? raise("maximum balance reached #{limit}!") : @balance
    end

    def in_journey?
      @entry_station != nil
    end
    
    def touch_in(station)
        if @balance < @journey.min then raise("not enough funds")
        end
        @entry_station = station
        # Journey.new(@entry_station, ) can we create a journey, should we?
    end

    def touch_out(station)
        @exit_station = station
        if @entry_station == nil
          @journey.make_penalty
        end
        deduct(journey.fare)
        # the above does not work because we need to create a journey in line 32
      
        @entry_station = nil
    end

    private
    def deduct(num)
      @balance = @balance - num
    end
end
