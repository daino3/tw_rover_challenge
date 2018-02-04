from rover import Rover
import unittest

class RoverTests(unittest.TestCase):
  def test_initialization(self):
    r = Rover('blue', '1 2 N', 'LRMRLM')
  
    self.assertEqual(r.color, 'blue')
    self.assertEqual(r.x_coord, 1)
    self.assertEqual(r.y_coord, 2)
    self.assertEqual(r.compass.direction(), 'N')
  
  def test_complete_mission(self):
    r = Rover('blue', '1 2 N', 'LMRMMMRMM')
  
    r.complete_mission()
    self.assertEqual(r.x_coord, 2)
    self.assertEqual(r.y_coord, 5)
  
  def test_current_position(self):
    r = Rover('blue', '1 2 N', 'LRMRLM')
  
    self.assertEqual(r.current_position(), "x: 1, y: 2, heading: N")
  
  def test_go_forward(self):
    r = Rover('blue', '1 2 N', 'LRMRLM')
  
    r.go_forward()
    self.assertEqual(r.x_coord, 1)
    self.assertEqual(r.y_coord, 3)
    
    # N, E, S, W -> W, N, E, S
    # facing West
    r.turn_left()
    r.go_forward()
    self.assertEqual(r.x_coord, 0)
    self.assertEqual(r.y_coord, 3)
  
    # same direction (W), end of latitude map
    for _ in range(2): r.turn_right() # E -> N -> W
    for _ in range(3): r.go_forward()
    self.assertEqual(r.x_coord, 3)
    self.assertEqual(r.y_coord, 3)