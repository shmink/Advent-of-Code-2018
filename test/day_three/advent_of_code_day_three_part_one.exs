defmodule AdventOfCode.DayThree.PartOne.Test do
  use ExUnit.Case
  alias AdventOfCode.DayThree

  @tag :day_three
  test "example" do
    values = [
      "#1 @ 1,3: 4x4",
      "#2 @ 3,1: 4x4",
      "#3 @ 5,5: 2x2"
    ]

    assert DayThree.one(values) == 4
  end
end
