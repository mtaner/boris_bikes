require_relative 'bike'


class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No more bikes" if empty?
    @bikes.pop
  end

  def dock bike
    fail "There are already #{DEFAULT_CAPACITY} bikes at the docking station" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
