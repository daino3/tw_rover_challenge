require_relative 'models/mission'
require_relative 'models/mission_visualizer'
require_relative 'models/rover'
require_relative 'models/terrain'

file_location = 'instructions.txt' 

mars_mission = Mission.new(file_location)
mars_mission.display_mission!
mars_mission.complete_mission!