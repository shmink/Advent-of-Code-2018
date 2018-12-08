defmodule AdventOfCode.DayOne.PartOne.Test do
  use ExUnit.Case
  alias AdventOfCode.DayOne

  @tag :day_one
  test "first example" do
    assert DayOne.one([+1, -2, +3, +1]) == 3
  end

  @tag :day_one
  test "second example" do
    assert DayOne.one([+1, +1, +1]) == 3
  end

  @tag :day_one
  test "third example" do
    assert DayOne.one([+1, +1, -2]) == 0
  end

  @tag :day_one
  test "fourth example" do
    assert DayOne.one([-1, -2, -3]) == -6
  end
end
