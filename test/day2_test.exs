defmodule Aoc17.Day2Test do
  use ExUnit.Case

  test "sample part1" do
    input = "
5 1 9 5
7 5 3
2 4 6 8
      "

    expected = 18
    got = Aoc17.Day2.part1(input)
    assert expected == got
  end

  test "actual input part1" do
    input = File.read!("./data/day2.txt")

    expected = 43074
    got = Aoc17.Day2.part1(input)

    assert expected == got
  end

  test "sample part2" do
    input = "
5 9 2 8
9 4 7 3
3 8 6 5
      "

    expected = 9
    got = Aoc17.Day2.part2(input)
    assert expected == got
  end

  test "actual input part2" do
    input = File.read!("./data/day2.txt")

    expected = 280
    got = Aoc17.Day2.part2(input)

    assert expected == got
  end
end
