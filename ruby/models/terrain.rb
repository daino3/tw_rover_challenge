class Terrain
  attr_reader :latitude, :longitude, :landscape

  def initialize(*position_data)
    @latitude  = position_data[0].to_i
    @longitude = position_data[1].to_i
    @landscape = map_terrain
  end

  def map_terrain
    landscape = Hash.new(0)
    @longitude.downto(0) do |y_coord|
      landscape[y_coord] = Array.new(@latitude+1, "-")
    end
    landscape
  end

end