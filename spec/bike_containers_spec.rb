require 'van'
describe BikeContainer do

shared_examples_for "bike containers" do
  let(:bike_containers) { described_class.new}
  describe '#bikes' do
    it "it has a storage for bikes" do
      bike_containers.bikes.should eq []
    end
  end
  describe Van do
    it_behaves_like "bike containers"
  end
end

end
