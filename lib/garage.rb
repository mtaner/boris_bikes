require 'bike_containers'

class Garage
attr_accessor :bikes
  include BikeContainer

  def accept_bikes(bikes)
    @bikes = bikes
    fix_bikes
  end

  private

  def fix_bikes
  @bikes.each {|bike| bike.broken = false}
  end
end
