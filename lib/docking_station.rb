require_relative 'bike'


class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    for i in 1..@bikes.length do
      return @bikes.delete_at(-i) if @bikes[-i].working?
    end

    fail "No bikes available"
    # fail "The bike is broken" if !@bikes.last.working?
    # @bikes.pop if @bikes.last.working?
  end

  def dock bike
    fail "There are already #{@capacity} bikes at the docking station" if full?
    @bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
