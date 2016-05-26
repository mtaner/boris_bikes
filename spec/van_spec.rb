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
      van = Van.new(2)
      van.bikes = ["dummy bike"]
      bike1 = double("bike1", :working? => false)
      bike2 = double("bike2", :working? => false)
      station = double("station", :bikes => [bike1, bike2])
      van.take_broken(station)
      expect{van.take_broken(station)}.to raise_error("Capacity reached")
      expect(van.bikes[1]).to eq bike1
      expect(station.bikes).to eq [bike2]
    end

  end



end
