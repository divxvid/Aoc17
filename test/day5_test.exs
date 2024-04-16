defmodule Aoc17.Day5Test do
  use ExUnit.Case, async: true

  @tag :skip
  test "sample part1" do
    input = "
0
3
0
1
-3"

    expected = 5
    got = Aoc17.Day5.part1(input)

    assert expected == got
  end

  @tag :skip
  test "input part1" do
    input = File.read!("./data/day5.txt")

    expected = 375_042
    got = Aoc17.Day5.part1(input)

    assert expected == got
  end

  test "sample part2" do
    input = "
0
3
0
1
-3"

    expected = 10
    got = Aoc17.Day5.part2(input)

    assert expected == got
  end

  test "input part2" do
    input = File.read!("./data/day5.txt")

    expected = 28_707_598
    got = Aoc17.Day5.part2(input)

    assert expected == got
  end
end
