class Oystercard

    attr_reader :balance, :total
    attr_accessor :limit, :status

    DEFAULT = 90
    MIN = 1
    def initialize(limit = DEFAULT, min = MIN)
        @balance = 0
        @total = 0
        @limit = limit
        @status
        @min = min
    end

    def top_up(num)
      total = balance + num
      total > limit ? raise("maximum balance reached #{limit}!") : total
    end

    def deduct(num)
      total = balance - num
    end

    def in_journey
      status = true
    end

    def touch_in(num)
        if num < @min then raise("not enough funds")
        end
        status = true
    end

    def touch_out(num)
        deduct(num)
        status = false
    end
end
