defmodule AdventOfCode.DayTwo.PartTwo.Test do
  use ExUnit.Case
  alias AdventOfCode.DayTwo

  @tag :day_two
  test "full example" do
    full = [
      "abcde",
      "fghij",
      "klmno",
      "pqrst",
      "fguij",
      "axcye",
      "wvxyz"
    ]

    assert DayTwo.two(full) == "fgij"
  end
end
