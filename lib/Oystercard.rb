class Oystercard

    attr_reader :balance, :entry_station
    attr_accessor :limit

    DEFAULT = 90
    MIN = 1
    def initialize(limit = DEFAULT, min = MIN)
        @balance = 0
        @limit = limit
        @min = min
    end

    def top_up(num)
      @balance = @balance + num
      @balance > limit ? raise("maximum balance reached #{limit}!") : @balance
    end



    def in_journey?
      @entry_station != nil
    end

    def touch_in(num, station)
        if num < @min then raise("not enough funds")
        end
        @entry_station = station
    end

    def touch_out(num)
        deduct(num)
        @entry_station = nil
    end

    private
    def deduct(num)
      @balance = @balance - num
    end
end
