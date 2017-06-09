defmodule RoverChallenge.Mission do
  defstruct [:rover, :commands]
  alias RoverChallenge.Rover

  def execute(mission) do
    commands = String.graphemes(mission.commands) # split the commands string
    r = execute_commands(mission.rover, commands)
    %{mission | rover: r}
    # HuntGather.work(rover_missions)
  end

  def execute_commands(rover, []), do: rover
  def execute_commands(rover, [h|tail] = _commands) do
    {:ok, r} = Rover.execute_command(rover, h)
    execute_commands(r, tail)
  end
end