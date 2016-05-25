require_relative 'bike'


class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No more bikes" if empty?
    @bikes.pop
  end

  def dock bike
    fail "There are already #{@capacity} bikes at the docking station" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
