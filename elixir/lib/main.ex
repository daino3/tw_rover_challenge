defmodule RoverChallenge.CLI do
  alias RoverChallenge.{CommandCenter, Rover}
  @default_file "data/mission_a.txt"

  def main(args \\ []) do
    {:ok, cc} = args |> parse_args |> generate_command_center
    cc = CommandCenter.execute_missions(cc)
    Enum.each(cc.missions, fn(m)->
      m.rover
      |> Rover.coordinates
      |> Tuple.to_list
      |> Enum.join(" ")
      |> IO.puts
    end)
  end

  def parse_args(args) do
    {opts, f_path, _} =
      OptionParser.parse(args, switches: [file: :boolean])
    {opts, f_path}
  end

  def generate_command_center({opts, f_path}) do
    if opts[:file], do: CommandCenter.from_file(f_path), else: CommandCenter.from_file(@default_file)
  end
end