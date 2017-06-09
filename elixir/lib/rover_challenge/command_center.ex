defmodule RoverChallenge.CommandCenter do
  defstruct [:missions, :terrain]
  alias RoverChallenge.{Mission, Rover, Terrain}

  def from_file(f_path) do
    case File.read(f_path) do
      {:ok, body}      -> {:ok, from_str(body)}
      {:error, reason} -> {:error, reason}
    end
  end

  def from_str(string) do
    mission_details =
      string
      |> String.strip
      |> String.split("\n")
      |> Enum.map(fn(e)-> String.strip(e) end)

    {terrain_info, mission_details} = List.pop_at(mission_details, 0)

    missions = create_missions(mission_details, [])
    %__MODULE__{missions: missions, terrain: Terrain.from(terrain_info)}
  end

  def create_missions([], acc), do: acc
  def create_missions([head|tail], acc) do
    # instructions = ["1 2 N", "LMRMLMRM"]
    # head = "1 2 N", tail = ["LMRMLMRM"]
    {command_info, new_tail} = List.pop_at(tail, 0)
    create_missions(new_tail, acc ++ [%Mission{rover: Rover.init(head), commands: command_info}])
  end

  def execute_missions(command_ctr) do
    %{command_ctr | missions: Enum.map(command_ctr.missions, fn(m)-> Mission.execute(m) end)}
  end
end