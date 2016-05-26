require "bike"

describe Bike do
  describe "#working?" do
    it "should respond to working?" do
      expect(subject).to respond_to(:working?)
    end
  end

  describe "#broken" do
    it "should respond to broken" do
      expect(subject).to respond_to(:broken)
    end
    it "should not be working if reported broken" do
      bike = Bike.new
      bike.broken
      expect(bike.working?).to eq false
    end
  end

  describe "#fixed" do
    it "should fix a broken bike" do
      bike = Bike.new
      bike.broken
      bike.fixed
      expect(bike.working?).to eq true
    end
  end
end
