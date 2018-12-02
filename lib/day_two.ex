defmodule AdventOfCode.DayTwo do
  @moduledoc """
  Day two of advent of code 2018
  """
  @doc """
  To make sure you didn't miss any, you scan the likely candidate boxes again,
  counting the number that have an ID containing exactly two of any letter and
  then separately counting those with exactly three of any letter. You can
  multiply those two counts together to get a rudimentary checksum and compare
  it to what your device predicts.

  For example, if you see the following box IDs:

      abcdef contains no letters that appear exactly two or three times.
      bababc contains two a and three b, so it counts for both.
      abbcde contains two b, but no letter appears exactly three times.
      abcccd contains three c, but no letter appears exactly two times.
      aabcdd contains two a and two d, but it only counts once.
      abcdee contains two e.
      ababab contains three a and three b, but it only counts once.

  Of these box IDs, four of them contain a letter which appears exactly twice,
  and three of them contain a letter which appears exactly three times.
  Multiplying these together produces a checksum of `4 * 3 = 12`.

  """
  def one(input, results \\ %{twos: 0, threes: 0}) do
    if input == [] do
      results.twos * results.threes
    else
      [head | tail] = input

      string_res =
        head
        |> String.graphemes()
        |> Enum.sort()
        |> Enum.chunk_by(fn arg -> arg end)
        |> count_letters()

      results = %{
        twos: results.twos + string_res.twos,
        threes: results.threes + string_res.threes
      }

      one(tail, results)
    end
  end

  defp count_letters(list, twos \\ 0, threes \\ 0) when is_list(list) do
    totals = Enum.map(list, fn x -> length(x) end)

    cond do
      list == [] ->
        %{twos: twos, threes: threes}

      Enum.member?(totals, 2) && Enum.member?(totals, 3) ->
        %{twos: 1, threes: 1}

      Enum.member?(totals, 2) ->
        %{twos: 1, threes: 0}

      Enum.member?(totals, 3) ->
        %{twos: 0, threes: 1}

      true ->
        %{twos: 0, threes: 0}
    end
  end
end
