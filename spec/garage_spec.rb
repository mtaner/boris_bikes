require 'garage'

describe Garage do
  describe "#fix_bikes" do
    it "responds to fix_bikes" do
      expect(subject).to respond_to(:fix_bikes)
    end

    it "fixes bikes in garage" do
      garage = Garage.new
      bike1 = double("bike1", :fixed => true)
      garage.bikes = [bike1]
      expect(garage.fix_bikes)
    end


  end
end
