class Terrain(object):
  def __init__(self, terrain_str):
    lat, long = terrain_str.split(' ')
    self.longitude = int(long) # int representing y axis length
    self.latitude = int(lat) # int representing x axis length
    self.reset_landscape()
            
    pass

  def reset_landscape(self):
    self.landscape = {}
    for i in xrange(0, self.longitude + 1):
      self.landscape[i] = [' '] * (self.latitude + 1)