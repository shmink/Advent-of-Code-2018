defmodule AdventOfCode.DayTwo.PartOne.Test do
  use ExUnit.Case
  alias AdventOfCode.DayTwo

  @tag :daytwo_part1
  test "full example" do
    full = [
      "abcdef",
      "bababc",
      "abbcde",
      "abcccd",
      "aabcdd",
      "abcdee",
      "ababab"
    ]

    assert DayTwo.one(full) == 12
  end
end
