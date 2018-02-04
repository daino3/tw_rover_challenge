from compass import Compass
from collections import deque
import unittest

class CompassTest(unittest.TestCase):
  def test_initialize(self):
    c = Compass('N')
    self.assertEqual(c.directions, deque(['N', 'E', 'S', 'W']))
  
    c = Compass('E')
    self.assertEqual(c.directions, deque(['E', 'S', 'W', 'N']))
  
    c = Compass('S')
    self.assertEqual(c.directions, deque(['S', 'W', 'N', 'E']))
  
    c = Compass('W')
    self.assertEqual(c.directions, deque(['W', 'N', 'E', 'S']))
