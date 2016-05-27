require 'bike_containers'
require 'van'


shared_examples_for "bike_containers" do
  let(:bike_containers) { described_class.new}
  describe '#bikes' do
    it "it has a storage for bikes" do
      expect(bike_containers.bikes).to eq([])
    end
  end
end

describe Van do
  it_behaves_like "bike_containers"
end
describe Garage do
  it_behaves_like "bike_containers"
end
describe DockingStation do
  it_behaves_like "bike_containers"
end
