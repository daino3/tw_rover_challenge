from collections import deque

class Compass(object):
  NORTH = 'N'
  EAST  = 'E'
  SOUTH = 'S'
  WEST  = 'W'

  def __init__(self, heading):
    self.directions = deque([
      self.NORTH,
      self.EAST,
      self.SOUTH,
      self.WEST], maxlen=4)

    self.rotate_until(heading)

    pass

  def rotate_until(self, goal):
    while True:
      if self.directions[0] == goal: break

      self.rotate_right()
    pass

  def rotate_left(self):
    directions = self.directions
    directions.rotate(1)
    self.directions = directions
    pass

  def rotate_right(self):
    directions = self.directions
    directions.rotate(-1)
    self.directions = directions
    pass

  def direction(self):
    return self.directions[0]
