require "van"

describe Van do
  describe "#take_broken" do
    it "responds to take_broken" do
      expect(subject).to respond_to(:take_broken)
    end

    it "takes broken bikes from a station" do
      bike1 = double("bike1", :working? => true)
      bike2 = double("bike2", :working? => false)
      station = double("station", :bikes => [bike1, bike2])
      van = Van.new
      van.take_broken(station)
      expect(van.bikes).to eq [bike2]
      expect(station.bikes).to eq [bike1]
    end

    it "stops taking broken bikes once capacity is reached" do
      van = Van.new(3)
      van.bikes = ["dummy bike"]
      bike1 = double("bike1", :working? => false)
      bike2 = double("bike2", :working? => false)
      bike3 = double("bike3", :working? => false)
      station = double("station", :bikes => [bike1, bike2, bike3])
      expect{van.take_broken(station)}.to raise_error("Van capacity reached")
      expect(van.bikes[1]).to eq bike3
      expect(station.bikes).to eq [bike1]
    end

  end

  describe "#deliver" do
    it "Responds to deliver" do
      expect(subject).to respond_to(:deliver)
    end
    it "Delivers broken bikes to garage" do
      van = Van.new
      van.bikes = ["dummy1","dummy2"]
      garage = double("garage", :bikes => [], :capacity => 10)
      van.deliver(garage)
      expect(van.bikes).to eq []
      expect(garage.bikes).to eq ["dummy2","dummy1"]
    end
  end
end
