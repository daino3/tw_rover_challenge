require 'rspec'
require_relative '../models/terrain'

describe Terrain do 
  let(:terrain) { Terrain.new(*[10, 8])}

  it 'has an accessible latitude attribute' do
    expect(terrain.latitude).to eq(10)
  end

  it 'has an accessible longitude attribute' do
    expect(terrain.longitude).to eq(8)
  end

  describe "#map_terrain" do
    it "returns a hash with keys as longitude values" do
      expect(terrain.landscape.keys.max).to eq(8)
    end

    it "returns a hash with values as latitude values" do
      expect(terrain.landscape.values.all? {|e| e.length == 11}).to be_true
    end
  end
end