defmodule TerrainTest do
  use ExUnit.Case
  alias RoverChallenge.Terrain

  describe "&landscape\1" do
    test "creates a nested list" do
      terrain = %Terrain{lat: 2, long: 3}
      landscape = Terrain.landscape(terrain)

      assert landscape[0] == Enum.map(0..2, fn(_)-> " " end)
      assert landscape[1] == Enum.map(0..2, fn(_)-> " " end)
      assert landscape[2] == Enum.map(0..2, fn(_)-> " " end)
      assert landscape[3] == Enum.map(0..2, fn(_)-> " " end)
    end
  end
end