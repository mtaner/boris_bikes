class Garage

  attr_accessor :bikes

  DEFAULT_CAPACITY = 20
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def fix_bikes
    @bikes.each {|bike| bike.fixed }
  end

end
