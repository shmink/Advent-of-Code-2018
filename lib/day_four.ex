defmodule AdventOfCode.DayFour do
  require IEx

  def one(input) do
    # Create a map with the guard ID as key and a list of the minutes
    # associated to them. "falls asleep" is a minus number
    data =
      input
      |> Enum.map(&extract_guard_id/1)
      |> Enum.sort()
      |> Enum.reduce({nil, %{}}, &accumulate_sleep_time/2)
      |> elem(1)

    {most_sleep_id, _most_sleep_time} =
      data
      |> Enum.reduce(%{}, &sum_sleep_time/2)
      |> Enum.max_by(fn {_key, value} -> value end)

    most_sleep_minute =
      Map.fetch!(data, most_sleep_id)
      |> Enum.chunk_every(2)
      |> Enum.reduce(%{}, fn list, map ->
        [start, endd | []] = list

        Enum.reduce((start - 1)..(endd * -1), map, fn x, map ->
          # IO.inspect(x)
          Map.update(map, x, 1, &(&1 + 1))
        end)
      end)
      |> Enum.max_by(fn {_k, v} -> v end)
      |> elem(0)

    String.to_integer(most_sleep_id) * most_sleep_minute
  end

  def sum_sleep_time({key, value}, acc) do
    Map.put(acc, key, Enum.sum(value))
  end

  def accumulate_sleep_time(sorted_list, {current_id, map}) do
    id = Map.fetch!(sorted_list, "id")

    if id == "" do
      {_pop, map} =
        Map.get_and_update!(map, current_id, fn list ->
          minute = Map.fetch!(sorted_list, "minute")
          {list, [minute | list]}
        end)

      {current_id, map}
    else
      map = Map.put_new(map, id, [])
      {id, map}
    end
  end

  def extract_guard_id(string) do
    regex =
      ~r/(?<datetime>\d{4}-\d{2}-\d{2} \d+:(?<minute>\d+)).*(#(?<id>\d+)|(?<status>falls|wakes))/

    result = regex |> Regex.named_captures(string)

    case Map.fetch!(result, "status") do
      "falls" ->
        %{result | "minute" => String.to_integer(Map.fetch!(result, "minute")) * -1}

      "wakes" ->
        %{result | "minute" => String.to_integer(Map.fetch!(result, "minute"))}

      "" ->
        result
    end
  end
end
