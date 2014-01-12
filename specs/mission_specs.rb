require 'rspec'
require_relative '../models/mission'

describe Mission do
  mission_file = "instructions.txt"
  test_file = 'test_inst.txt'
  COMMANDS = %w(L R M)
  let(:mission) { Mission.new(mission_file) }
  let(:test_mission) { Mission.new(test_file) }

  it 'initializes with rovers' do
    expect(mission.rovers.all? {|rover| rover.kind_of? Rover}).to be_true
  end

  it 'initializes with terrain data' do
    expect(mission.terrain.kind_of? Terrain).to be_true
  end

  it 'parses instructions correctly' do
    expect(mission.instructions.join.split("").all? {|command| COMMANDS.include?(command) }).to be_true
  end

  describe "#complete_mission!" do
    it "returns a rover object" do
      expect(test_mission.complete_mission!.first).to be_an(Rover) 
    end

    it "returns a rover object with correct x_coordinate" do
      expect(test_mission.complete_mission!.first.x_coord).to eq(1) 
    end

    it "returns a rover object with correct y_coordinate" do
      expect(test_mission.complete_mission!.first.y_coord).to eq(3) 
    end

    it "returns a rover object with correct heading" do
      expect(test_mission.complete_mission!.first.heading).to eq("N")
    end
  end 
end