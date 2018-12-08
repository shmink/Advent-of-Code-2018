defmodule AdventOfCode.DayOne.PartTwo.Test do
  use ExUnit.Case
  alias AdventOfCode.DayOne

  @tag :day_one
  test "first example" do
    assert DayOne.two([1, -2, 3, 1]) == 2
  end

  @tag :day_one
  test "second example" do
    assert DayOne.two([+1, -1]) == 0
  end

  @tag :day_one
  @tag :poop
  test "third example" do
    assert DayOne.two([+3, +3, +4, -2, -4]) == 10
  end

  @tag :day_one
  test "fourth example" do
    assert DayOne.two([-6, +3, +8, +5, -6]) == 5
  end

  @tag :day_one
  test "fifth example" do
    assert DayOne.two([+7, +7, -2, -7, -4]) == 14
  end
end
