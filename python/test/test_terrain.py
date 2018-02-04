from nose.tools import *
from terrain import Terrain
import unittest

class TerrainTests(unittest.TestCase):
  def test_initialization(self):
    t = Terrain('2 3')
  
    assert_equal(t.latitude, 2)
    assert_equal(t.longitude, 3)
    assert_equal(t.landscape[3], [' ', ' ', ' '])
    assert_equal(t.landscape[2], [' ', ' ', ' '])
    assert_equal(t.landscape[1], [' ', ' ', ' '])
    assert_equal(t.landscape[0], [' ', ' ', ' '])
