defmodule AdventOfCode.DayThree do
  @moduledoc """
  Day three of advent of code.
  """
  require IEx

  def one(input) do
    input
    |> Enum.map(&parser(&1))
    |> calculate_claims()
    |> Enum.filter(fn {_, x} -> x > 1 end)
    |> length
  end

  defp calculate_claims(input) do
    input
    |> Enum.reduce(%{}, fn claim, map ->
      Enum.reduce(claim.start_x..claim.end_x, map, fn x, acc ->
        Enum.reduce(claim.start_y..claim.end_y, acc, fn y, acc_2 ->
          Map.update(acc_2, {x, y}, 1, &(&1 + 1))
        end)
      end)
    end)
  end

  defp parser(input) do
    parsed =
      input
      |> String.split(["#", " @ ", ",", ": ", "x"], trim: true)

    [id, x, y, w, h] = parsed

    id = String.to_integer(id)
    x = String.to_integer(x)
    y = String.to_integer(y)
    w = String.to_integer(w)
    h = String.to_integer(h)

    %{id: id, start_x: x + 1, end_x: x + w, start_y: y + 1, end_y: y + h}
  end

  def two(input) do
    claims = Enum.map(input, &parser(&1))
    map = calculate_claims(claims)

    claims
    |> Enum.reduce_while(false, fn claim, _acc ->
      result =
        Enum.reduce_while(claim.start_x..claim.end_x, false, fn x, _ ->
          result =
            Enum.reduce_while(claim.start_y..claim.end_y, false, fn y, _ ->
              count = Map.get(map, {x, y})

              if count > 1 do
                {:halt, false}
              else
                {:cont, true}
              end
            end)

          if !result do
            {:halt, false}
          else
            {:cont, true}
          end
        end)

      if result do
        {:halt, claim.id}
      else
        {:cont, false}
      end
    end)
  end
end
