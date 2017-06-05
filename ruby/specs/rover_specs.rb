require 'rspec'
require_relative '../models/rover'

describe Rover do 
  let(:rover) { Rover.new("test", *[0, 0, "N"])}

  it 'has accessible attributes' do
    expect(rover.name).to eq("test")
    expect(rover.x_coord).to eq(0)
    expect(rover.y_coord).to eq(0)
    expect(rover.heading).to eq("N")
  end

  describe "#current_positioning" do
    it 'returns the current coordinates and heading of the rover as a string' do
      expect(rover.current_positioning).to eq("0, 0, N")
    end
  end

  describe "#current_positioning" do
    it 'returns the current coordinates and heading of the rover as a string' do
      expect(rover.current_positioning).to eq("0, 0, N")
    end
  end

  describe "#move" do
    it "changes the coordinates of the rover in the direction of the heading variable"do
      rover.move("R")
      rover.move("M")
      expect(rover.heading).to eq("E")
      expect(rover.x_coord).to eq(1)
    end
  end
end