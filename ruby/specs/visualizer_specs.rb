require 'rspec'
require_relative '../models/mission_visualizer'

describe MissionVisualizer do
  let(:mission_data) { {terrain: Terrain.new(*[10, 8]), rovers: [Rover.new("test", *[0, 0, "N"])], instructions: ["RMLMM"]}}
  let(:visualizer) { MissionVisualizer.new(mission_data) }
  COMMANDS = %w(L R M)

  it 'initializes with a landscape' do
    expect(visualizer.landscape).to be_an(Hash)
  end

  it 'initializes with a group of rovers' do
    expect(visualizer.rovers.flatten.all? {|rover| rover.kind_of? (Rover)}).to be_true
  end

  it 'initializes with a set of instructions' do
    expect(visualizer.instructions.join.split("").all? {|command| COMMANDS.include?(command) }).to be_true
  end

  # describe "#run!" do
  #   it "executes with valid inputs" do
  #     expect { visualizer.run! }.to_not raise_error
  #   end
  # end
end