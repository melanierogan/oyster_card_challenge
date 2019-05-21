class Station

    attr_reader :name, :zone

    def initialize(zone, name)
        @name = name
        @zone = zone
    end
end