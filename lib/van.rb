class Van
  attr_accessor :bikes
  DEFAULT_CAPACITY = 20
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def take_broken(station)
    station.bikes.each do |bike|
      if (bike.working? == false && @bikes.length < @capacity)
        @bikes << bike
        station.bikes.delete(bike)
      elsif @capacity == @bikes.length
        fail "Capacity reached"
      end
    end
  end
end
