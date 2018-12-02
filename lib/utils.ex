defmodule AdventOfCode.Utils do
  def input_to_list(input) when is_bitstring(input) do
    input_lines_into_list(input)
    |> Enum.map(&String.to_integer(&1))
  end

  def input_lines_into_list(file) do
    File.read!("./inputs/" <> file)
    |> String.split("\n", trim: true)
  end
end
