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

  @doc """
  The boxes will have IDs which differ by exactly one character at the same position
  in both strings. For example, given the following box IDs:

      abcde
      fghij
      klmno
      pqrst
      fguij
      axcye
      wvxyz

  The IDs abcde and axcye are close, but they differ by two characters (the second and
  fourth). However, the IDs fghij and fguij differ by exactly one character, the third
  (h and u). Those must be the correct boxes.
  """
  def two(input, best_match \\ "") do
    cond do
      input == [] ->
        best_match

      length(input) == 2 ->
        return_better_match(best_match, List.first(input), List.last(input))

      [head | tail] = input ->
        best_match = baby_recurse(tail, head, best_match)
        two(tail, best_match)
    end
  end

  defp baby_recurse(input, string, best_match \\ "") do
    case input do
      [] ->
        best_match

      [head | tail] ->
        best_match = return_better_match(best_match, string, head)
        baby_recurse(tail, string, best_match)

      _ ->
        {:error, :you_are_dumb}
    end
  end

  defp return_better_match(original, string1, string2) do
    if String.length(original) < String.length(calculate_similarities(string1, string2)) do
      calculate_similarities(string1, string2)
    else
      original
    end
  end

  defp calculate_similarities(string1, string2) do
    values = ""

    similars = String.myers_difference(string1, string2)

    eqs = for {:eq, value} <- similars, do: values <> value

    List.to_string(eqs)
  end
end
