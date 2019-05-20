class Oystercard

    attr_reader :balance, :total
    attr_accessor :limit
    
    DEFAULT = 90
    def initialize(limit = DEFAULT)
        @balance = 0
        @total
        @limit = limit

    end

    def top_up(num)
      total = balance + num 
      total > limit ? raise("maximum balance reached #{limit}!") : total
    end

end
