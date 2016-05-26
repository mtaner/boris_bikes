class Van
  attr_accessor :bikes
  DEFAULT_CAPACITY = 20
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def take_broken(station)
    n = station.bikes.length - 1
    while n >= 0 do
      if (station.bikes[n].working? == false && @bikes.length < @capacity)
        @bikes << station.bikes[n]
        station.bikes.delete_at(n)
      elsif @capacity == @bikes.length
        fail "Van capacity reached"
      end
      n-=1
    end
  end

  def deliver(garage)
    n = @bikes.length - 1
    while n >= 0 do
      if  garage.bikes.length < garage.capacity
        garage.bikes << @bikes[n]
        @bikes.delete_at(n)
      elsif garage.capacity == garage.bikes.length
        fail "Garage capacity reached"
      end
      n-=1
    end
  end

  def collect(garage)
    n = garage.bikes.length - 1
    while n >= 0 do
      if @bikes.length < @capacity
        @bikes << garage.bikes[n]
        garage.bikes.delete_at(n)
      elsif @capacity == @bikes.length
        fail "Van capacity reached"
      end
      n-=1
    end
  end

  def distribute(station)
    n = @bikes.length - 1
    while n >= 0 do
      if  station.bikes.length < station.capacity
        station.bikes << @bikes[n]
        @bikes.delete_at(n)
      elsif station.capacity == station.bikes.length
        fail "Station capacity reached"
      end
      n-=1
    end
  end

end
