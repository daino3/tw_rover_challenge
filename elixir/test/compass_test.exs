defmodule RoverChallenge.CompassTest do
  use ExUnit.Case
  alias RoverChallenge.Compass

  test "it initializes with default cardinal directions" do
    assert %Compass{}.directions  == ["N", "E", "S", "W"]
    assert Compass.directions  == ["N", "E", "S", "W"]
  end

  describe "&rotate_right/0" do
    test "turns the compass" do
      compass = %Compass{directions: ["N", "E", "S", "W"]}
      new_compass = Compass.rotate_right(compass)
      assert new_compass.directions == ["E", "S", "W", "N"]
    end
  end

  describe "&rotate_left/0" do
    test "turns the compass" do
      compass = %Compass{directions: ["N", "E", "S", "W"]}

      compass = Compass.rotate_left(compass)
      assert compass.directions == ["W", "N", "E", "S"]

      compass = Compass.rotate_left(compass)
      assert compass.directions == ["S", "W", "N", "E"]
    end
  end

  describe "&init/1" do
    test "initializes a compass with the correct directions" do
      compass = Compass.init("E")
      assert compass.directions == ["E", "S", "W", "N"]

      compass = Compass.init("S")
      assert compass.directions == ["S", "W", "N", "E"]
    end
  end
end