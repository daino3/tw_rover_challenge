defmodule RoverChallenge.Rover do
  defstruct [:x_coord, :y_coord, :compass]
  alias RoverChallenge.Compass

  @moduledoc """
  Documentation for RoverChallenge.Rover
  """

  def init(location_str) when is_bitstring(location_str) do
    [x_coord, y_coord, heading] = location_str |> String.split(" ")
    init(x_coord, y_coord, heading)
  end

  def init(x, y, heading) do
    %__MODULE__{
      x_coord: String.to_integer(x),
      y_coord: String.to_integer(y),
      compass: Compass.init(heading)
    }
  end

  def execute_command(rover, command) do
    case command do
      "L" -> turn_left(rover)
      "R" -> turn_right(rover)
      "M" -> go_forward(rover)
      _   -> {:error, "the command '#{command}' is invalid"}
    end
  end

  def coordinates(rover) do
    {rover.x_coord, rover.y_coord, Compass.direction(rover.compass)}
  end

  defp turn_right(rover), do: {:ok, %{rover | compass: Compass.rotate_right(rover.compass)}}
  defp turn_left(rover),  do: {:ok, %{rover | compass: Compass.rotate_left(rover.compass)}}
  defp go_forward(rover) do
    case Compass.direction(rover.compass) do
      "N" -> {:ok, %{rover | y_coord: rover.y_coord + 1}}
      "E" -> {:ok, %{rover | x_coord: rover.x_coord + 1}}
      "S" -> {:ok, %{rover | y_coord: rover.y_coord - 1}}
      "W" -> {:ok, %{rover | x_coord: rover.x_coord - 1}}
      _   -> {:error, "your compass is broken - '#{rover.compass.directions}'"}
    end
  end
end
