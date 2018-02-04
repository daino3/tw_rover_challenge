import time
from terrain import Terrain
from rover import Rover


class Mission(object):
    # Up to 5 missions at one time; tuples makes this immutable
    COLORS = (
        'BLUE',
        'RED',
        'GREEN',
        'PURPLE',
        'YELLOW'
    )

    @classmethod
    def from_file(cls, f_path):
        file_contents = [line.rstrip() for line in open(f_path)]
        return cls.create_mission(file_contents)

    @classmethod
    def from_str(cls, string):
        mission_details = [line.strip() for line in string.strip().split('\n')]
        return cls.create_mission(mission_details)

    @classmethod
    def create_mission(cls, mission_details):
        terrain = Terrain(mission_details.pop(0))  # '5 5'

        colors = list(Mission.COLORS)
        rovers = []
        while True:
            rover_loc = mission_details.pop(0)  # '1 2 N'
            commands = mission_details.pop(0)  # 'LMLMLMLMM'

            rovers.append(Rover(colors.pop(0), rover_loc, commands))
            if not mission_details:
                break

        return Mission(terrain, rovers)

    def __init__(self, terrain, rovers=[]):
        self.terrain = terrain
        self.rovers = rovers

        pass

    def complete_rover_missions(self):
        for rover in self.rovers:
            rover.complete_mission()

        pass

    def display_rover_missions(self):
        for rover in self.rovers:
            commands = list(rover.commands)
            while commands:
                print(rover.current_position())
                rover.execute_command(commands.pop(0))
                self.terrain.reset_landscape()
                self.terrain.landscape[rover.y_coord][rover.x_coord] = rover.color[0]
                for k in reversed(self.terrain.landscape.keys()): print(k, self.terrain.landscape[k])
                time.sleep(1)
            print("Rover: {0}, Position: {1}".format(rover.color[0], rover.current_position()))
