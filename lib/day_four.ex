defmodule AdventOfCode.DayFour do
  def one(input) do
    input
    |> Enum.map(&parser(&1))
    |> Enum.sort(&(NaiveDateTime.compare(List.first(&1), List.first(&2)) == :gt))

    # Enum.sort(input, ...)
  end

  def parser(input) do
    split =
      input
      |> String.split(["[", "-", " ", ":", "]"], trim: true)

    [yr, mnth, day, hr, min | tail] = split

    parsed = [
      NaiveDateTime.new(
        String.to_integer(yr),
        String.to_integer(mnth),
        String.to_integer(day),
        String.to_integer(hr),
        String.to_integer(min),
        0
      ),
      Enum.join(tail, " ")
    ]

    [{:ok, naive_date_time}, text] = parsed
    [naive_date_time, text]
  end

  def input do
    [
      "[1518-08-19 00:35] wakes up",
      "[1518-06-06 23:56] Guard #179 begins shift",
      "[1518-11-11 23:56] Guard #2269 begins shift",
      "[1518-05-18 00:15] falls asleep",
      "[1518-07-28 00:52] wakes up",
      "[1518-07-09 00:25] falls asleep",
      "[1518-03-09 00:21] falls asleep",
      "[1518-09-02 00:37] wakes up",
      "[1518-04-17 00:09] falls asleep",
      "[1518-04-05 00:17] wakes up",
      "[1518-05-12 00:56] wakes up",
      "[1518-04-30 00:46] wakes up",
      "[1518-07-18 00:57] falls asleep",
      "[1518-07-11 00:37] falls asleep",
      "[1518-10-13 00:12] falls asleep",
      "[1518-04-09 23:59] Guard #1913 begins shift",
      "[1518-08-10 00:04] Guard #421 begins shift",
      "[1518-10-05 00:35] wakes up",
      "[1518-08-27 00:54] wakes up",
      "[1518-10-07 23:57] Guard #179 begins shift",
      "[1518-10-05 00:23] falls asleep",
      "[1518-06-11 00:45] falls asleep",
      "[1518-09-01 00:51] wakes up",
      "[1518-10-28 23:58] Guard #277 begins shift",
      "[1518-09-11 00:03] Guard #179 begins shift",
      "[1518-05-14 00:54] wakes up",
      "[1518-11-14 00:23] falls asleep"
    ]
  end
end
