defmodule RoverChallenge.Compass do
  @directions ["N", "E", "S", "W"]
  defstruct [directions: @directions]

  def init(heading) do
    rotate_until(%__MODULE__{}, heading)
  end

  def rotate_left(compass) do
    d = compass.directions
    %{compass | directions: [Enum.at(d, -1) | Enum.drop(d, -1)]}
  end

  def rotate_right(compass) do
    [h|t] = compass.directions
    %{compass | directions: t ++ [h]}
  end

  defp rotate_until(compass, heading) do
    if direction(compass) == heading do
      compass
    else
      compass
      |> rotate_right
      |> rotate_until(heading)
    end
  end

  def direction(compass), do: Enum.at(compass.directions, 0)
  def directions, do: @directions
end