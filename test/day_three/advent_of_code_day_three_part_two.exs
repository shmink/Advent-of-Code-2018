defmodule AdventOfCode.DayThree.PartTwo.Test do
  use ExUnit.Case
  alias AdventOfCode.DayThree

  @tag :day_three
  test "example" do
    values = [
      "#1 @ 1,3: 4x4",
      "#2 @ 3,1: 4x4",
      "#3 @ 5,5: 2x2"
    ]

    assert DayThree.two(values) == 3
  end
end
