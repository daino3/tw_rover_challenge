defmodule RoverChallenge.Terrain do
  defstruct [:lat, :long]

  def from(terrain_str) do
    [lat, long] = String.split(terrain_str, " ")
                  |> Enum.map(fn(e)-> String.to_integer(e) end)

    %__MODULE__{lat: lat, long: long}
  end

  def landscape(terrain) do
    Enum.reduce(0..terrain.long, %{}, fn(long, acc)->
      Map.put(acc, long, List.duplicate(" ", terrain.lat + 1))
    end)
  end
end