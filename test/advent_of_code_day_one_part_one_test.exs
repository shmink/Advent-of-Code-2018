defmodule AdventOfCode.DayOne.PartOne.Test do
  use ExUnit.Case
  alias AdventOfCode.DayOne

  @tag :dayone_part1
  test "first example" do
    assert DayOne.one([+1, -2, +3, +1]) == 3
  end

  @tag :dayone_part1
  test "second example" do
    assert DayOne.one([+1, +1, +1]) == 3
  end

  @tag :dayone_part1
  test "third example" do
    assert DayOne.one([+1, +1, -2]) == 0
  end

  @tag :dayone_part1
  test "fourth example" do
    assert DayOne.one([-1, -2, -3]) == -6
  end
end
