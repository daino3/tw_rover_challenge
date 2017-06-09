defmodule RoverChallenge.CommandCenterTest do
  use ExUnit.Case
  alias RoverChallenge.{CommandCenter, Compass, Rover}

  @test_mission """
    5 5
    1 2 N
    LMLMLMLMM
    3 3 E
    MMRMMRMRRM
  """

  describe "&from_file/1" do
    test "does some stuff" do
      {:ok, cc} = CommandCenter.from_file(Path.expand("./data/mission_a.txt"))

      assert length(cc.missions) == 1
    end
  end

  describe "&from_str/1" do
    setup do
      {:ok, command_center: CommandCenter.from_str(@test_mission)}
    end

    test "creates 2 rovers from the test data", %{command_center: command_center} do
      assert length(command_center.missions) == 2
    end

    test "creates properly initialized rovers", %{command_center: command_center} do
      {:ok, m1} = Enum.fetch(command_center.missions, 0)
      {:ok, m2} = Enum.fetch(command_center.missions, 1)

      assert m1.rover.x_coord == 1
      assert m1.rover.y_coord == 2
      assert Compass.direction(m1.rover.compass) == "N"
      assert m1.commands == "LMLMLMLMM"

      assert m2.rover.x_coord == 3
      assert m2.rover.y_coord == 3
      assert Compass.direction(m2.rover.compass) == "E"
      assert m2.commands == "MMRMMRMRRM"
    end

    test "creates proper terrain", %{command_center: command_center} do
      assert command_center.terrain.lat == 5
      assert command_center.terrain.long == 5
    end
  end

  @tag :focus
  describe "&execute_missions\1" do
    setup do
      {:ok, command_center: CommandCenter.from_str(@test_mission)}
    end

    test "completes multiple missions", %{command_center: command_center} do
      cc = CommandCenter.execute_missions(command_center)

#     1 2 N
#     LM     LM     LM     LMM
#     0,2,W  0,1,S  1,1,E  1,3,N
      m1 = Enum.at(cc.missions, 0)
      assert Rover.coordinates(m1.rover) == {1, 3, "N"}

      m2 = Enum.at(cc.missions, 1)
      assert Rover.coordinates(m2.rover) == {5, 1, "E"}
    end
  end
end