defmodule Aoc17.Day3Test do
  use ExUnit.Case

  test "sample part1" do
    test_data = %{
      1 => 0,
      12 => 3,
      23 => 2,
      1024 => 31,
      26 => 5,
      30 => 5,
      37 => 6
    }

    Enum.each(test_data, fn {input, expected} ->
      got = Aoc17.Day3.part1(input)
      assert {input, expected} == {input, got}
    end)
  end

  test "input part1" do
    expected = 480
    got = Aoc17.Day3.part1(347_991)

    assert expected == got
  end

  test "sample part2" do
    test_data = %{
      1 => 2,
      5 => 10,
      23 => 25,
      54 => 57,
      100 => 122,
      150 => 304,
      500 => 747
    }

    Enum.each(test_data, fn {input, expected} ->
      got = Aoc17.Day3.part2(input)
      assert {input, expected} == {input, got}
    end)
  end

  test "input part2" do
    expected = 349_975
    got = Aoc17.Day3.part2(347_991)

    assert expected == got
  end
end
