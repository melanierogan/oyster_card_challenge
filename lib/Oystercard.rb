class Oystercard

    attr_reader :balance, :total
    attr_accessor :limit

    DEFAULT = 90
    def initialize(limit = DEFAULT)
        @balance = 0
        @total
        @limit = limit
        @status
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

    def touch_in
        status = true
    end

    def touch_out
        status = false
    end
end
