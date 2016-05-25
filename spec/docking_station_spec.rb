require 'docking_station'

describe DockingStation do
  ds = DockingStation.new
  bike = Bike.new

  it "should respond to release bike" do
    expect(subject).to respond_to(:release_bike)
  end

  it "should expect the bike to be working" do
    expect(bike).to respond_to(:working?)
  end

  it "should respond to docking one bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "should show a bike that has been docked" do
    docked_bike = ds.dock(bike)
    expect(ds.bikes).to eq docked_bike
  end

  it "should release a bike" do
    2.times {subject.dock(bike)}
    #subject.release_bike
    #expect(subject.bikes.length).to eq 1
    expect(subject.release_bike).to eq subject.bikes[-1]
  end

  it "raises an error if no bikes are available" do
    expect{subject.release_bike}.to raise_error "No more bikes"
  end

  it "raises an error if there are already 20 bikes at the docking station" do
    expect {21.times {subject.dock(bike)}}.to raise_error "There are already 20 bikes at the docking station"
  end
end


# nouns: member [of the public], bikes, docking stations, availability
# verbs: release [bike], check docking station, not being charged [unnecessarily], not being confused
