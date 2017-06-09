defmodule RoverChallenge.RoverTest do
  use ExUnit.Case
  alias RoverChallenge.{Compass, Rover}

  test "&from_str/1" do
    rover = Rover.init("1 2 N")

    assert rover.x_coord == 1
    assert rover.y_coord == 2
    assert Compass.direction(rover.compass) == "N"
  end

  describe "&execute_command/2" do
    setup do
      {:ok, %{rover: Rover.init("1 2 N")}}
    end

    test "it moves forward (M)", %{rover: rover} do
      {:ok, rover} = Rover.execute_command(rover, "M")
      assert Rover.coordinates(rover) == {1, 3, "N"}
    end

    test "it moves left (L)", %{rover: rover} do
      {:ok, rover} = Rover.execute_command(rover, "L")
      assert Rover.coordinates(rover) == {1, 2, "W"}

      {:ok, rover} = Rover.execute_command(rover, "M")
      assert Rover.coordinates(rover) == {0, 2, "W"}
    end

    test "it moves right (R)", %{rover: rover} do
      {:ok, rover} = Rover.execute_command(rover, "R")
      assert Rover.coordinates(rover) == {1, 2, "E"}

      {:ok, rover} = Rover.execute_command(rover, "M")
      assert Rover.coordinates(rover) == {2, 2, "E"}
    end
  end
end
