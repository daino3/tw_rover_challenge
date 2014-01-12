require 'csv'

class Mission
  attr_reader :rovers, :terrain, :instructions

  def initialize(file_location)
    @ROVER_NAMES   = %w(Red Blue Green Alpha Bravo Charlie Delta)
    @file          = File.open(file_location)
    @mission_data  = map_data(parse)
    @rovers        = get_rover_data
    @terrain       = get_terrain_data
    @instructions  = @mission_data[:instructions]
  end

  def complete_mission!
    @instructions.each_with_index do |commands, rover_index|
      commands.split("").each do |command|
        @rovers[rover_index].move(command)
      end
    end
    print_rover_positions
  end

  def display_mission!
    rover_clones  = get_rover_data
    data          = {terrain: @terrain, rovers: rover_clones, instructions: @instructions}
    visualizer    = MissionVisualizer.new(data)
    visualizer.run!
  end

  private
  
  def print_rover_positions
    @rovers.each do |rover|
      puts "#{rover.name}: #{rover.current_positioning}"
    end
  end

  def get_rover_data
    rovers = @mission_data[:rovers].map do |location_info|
      Rover.new(@ROVER_NAMES.sample, *location_info)
    end
    rovers
  end

  def get_terrain_data
    Terrain.new(*@mission_data[:terrain_info])
  end

  def parse
    separator  = " "
    file_data  = []
    CSV.foreach(@file, col_sep: separator) do |row|
      file_data << row
    end
    file_data
  end

  def map_data(file_data)
    data = Hash.new
    data[:terrain_info] = file_data.shift
    data[:rovers]       = file_data.select.each_with_index {|ele, index| index.even? }
    data[:instructions] = file_data.select.each_with_index {|ele, index| index.odd? }.flatten
    data
  end

end