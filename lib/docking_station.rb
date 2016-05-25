require_relative 'bike'

class DockingStation

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No more bikes" if @bikes.empty?
    @bikes.pop
  end

  def dock bike
    fail "There are already 20 bikes at the docking station" if @bikes.length >= 20
    @bikes << bike
  end

end
