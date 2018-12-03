defmodule AdventOfCode.DayThree do
  @moduledoc """
  Day three of advent of code.
  """

  def one(input) do
    parsed =
      input
      |> String.split(["#", " @ ", ",", ": ", "x"], trim: true)

    [id, v_pad, h_pad, width, height] = parsed

    id = String.to_integer(id)
    v_pad = String.to_integer(v_pad)
    h_pad = String.to_integer(h_pad)
    width = String.to_integer(width)
    height = String.to_integer(height)

    do_output(id, v_pad, h_pad, width, height)
  end

  def do_output(id, v_pad, h_pad, width, height) when h_pad > 0 do
    Enum.each(0..(h_pad + h_pad + width), fn x ->
      IO.write(".")
    end)

    IO.write("\n")
    do_output(id, v_pad, h_pad - 1, width, height)
  end
end
