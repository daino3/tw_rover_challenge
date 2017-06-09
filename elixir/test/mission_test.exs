defmodule RoverChallenge.MissionTest do
  use ExUnit.Case
  alias RoverChallenge.{Mission, Rover}

  describe "&execute/1" do
    test "completes a missions" do
      m = %Mission{rover: Rover.init("1 2 N"), commands: "MRM"}
      m = Mission.execute(m)

      assert Rover.coordinates(m.rover) == {2, 3, "E"}
    end
  end
end