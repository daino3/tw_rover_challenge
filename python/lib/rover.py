from compass import Compass

class Rover(object):
  def __init__(self, color, location_str, command_str):
    self.color   = color
    x, y, heading = location_str.split(' ')
    self.x_coord = int(x)
    self.y_coord = int(y)
    self.compass = Compass(heading)
    self.commands = command_str

    pass
  
  def complete_mission(self):
    for c in self.commands:
      self.execute_command(c)
  
    pass
  
  def execute_command(self, command):
    if command == "L":
      self.turn_left()
    elif command == "R":
      self.turn_right()
    elif command == "M":
      self.go_forward()
    else:
      raise ValueError("incorrect command! - {0}".format(c))
  
  def current_position(self):
    return "x: {0}, y: {1}, heading: {2}".format(self.x_coord, self.y_coord, self.compass.direction())

  def go_forward(self):
    heading = self.compass.direction()
 
    if heading == Compass.NORTH:
      self.y_coord += 1
    elif heading == Compass.EAST:
      self.x_coord += 1
    elif heading == Compass.SOUTH:
      self.y_coord -= 1
    elif heading == Compass.WEST:
      self.x_coord -= 1
    else:
      raise ValueError("incorrect heading! - {0}".format(heading))
    pass

  def turn_left(self):
    self.compass.rotate_left()
    pass

  def turn_right(self):
    self.compass.rotate_right()
    pass


