=begin
#unnecesary to test (private)
require "bike"
require "docking_station"

describe DockingStation do
  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq subject.bikes
  end
end
=end
