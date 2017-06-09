defmodule RoverChallenge.CLITest do
  use ExUnit.Case
  alias RoverChallenge.CLI

  describe "&main/1" do
    test "runs the executable script" do
      assert CLI.main(["--file", "data/mission_a.txt"]) == :ok
      assert CLI.main(["--file", "data/mission_b.txt"]) == :ok
    end
  end
end