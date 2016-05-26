require 'docking_station'

describe DockingStation do
  let(:bike) {double :bike}

  describe "#dock" do
    it "should respond to docking one bike" do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it "raises an error if there are already 20 bikes at the docking station" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error "There are already #{DockingStation::DEFAULT_CAPACITY} bikes at the docking station"
    end

    it "raises an error if there are already more bikes than capacity set" do
      ds3 = DockingStation.new(40)
      expect {41.times{ds3.dock(bike)}}.to raise_error "There are already 40 bikes at the docking station"
    end
  end

  describe "#release_bike" do
    it "should respond to release bike" do
      expect(subject).to respond_to(:release_bike)
    end

    it "raises an error if no bikes are available" do
      expect{subject.release_bike}.to raise_error "No bikes available"
    end

    it "should not release a bike if it's broken" do
      station = DockingStation.new
      bike2 = double("bike2", :working? => false)
      station.dock(bike2)
      expect{station.release_bike}.to raise_error("No bikes available")
    end

    it "should release the next working bike" do
      station = DockingStation.new
      bike = double("bike", :working? => true)
      bike2 = double("bike2", :working? => false)
      station.dock(bike)
      station.dock(bike2)
      expect(station.release_bike).to eq bike
    end
  end

  it "should be able to set different capacities" do
    expect(DockingStation.new(30).capacity).to eq 30
  end

end


# nouns: member [of the public], bikes, docking stations, availability
# verbs: release [bike], check docking station, not being charged [unnecessarily], not being confused
