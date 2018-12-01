defmodule AdventOfCode.DayOne.Test do
  use ExUnit.Case
  alias AdventOfCode.DayOne

  @tag :dayone
  test "first example" do
    assert DayOne.calc([+1, -2, +3, +1]) == 3
  end

  @tag :dayone
  test "second example" do
    assert DayOne.calc([+1, +1, +1]) == 3
  end

  @tag :dayone
  test "third example" do
    assert DayOne.calc([+1, +1, -2]) == 0
  end

  @tag :dayone
  test "fourth example" do
    assert DayOne.calc([-1, -2, -3]) == -6
  end
end
