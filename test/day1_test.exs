defmodule Aoc17.Day1Test do
  use ExUnit.Case, async: true

  @tag :skip
  test "testing samples for part1" do
    test_data = %{
      "1122" => 3,
      "1111" => 4,
      "1234" => 0,
      "91212129" => 9
    }

    Enum.each(test_data, fn {input, expected} ->
      got = Aoc17.Day1.part1(input)
      assert {input, expected} == {input, got}
    end)
  end

  @tag :skip
  test "part1 solution with actual input" do
    got =
      File.read!("./data/day1.txt")
      |> Aoc17.Day1.part1()

    expected = 1228
    assert expected == got
  end

  @tag :skip
  test "testing samples for part2" do
    test_data = %{
      "1212" => 6,
      "1221" => 0,
      "123425" => 4,
      "123123" => 12,
      "12131415" => 4
    }

    Enum.each(test_data, fn {input, expected} ->
      got = Aoc17.Day1.part2(input)
      assert {input, expected} == {input, got}
    end)
  end

  @tag :skip
  test "part2 solution with actual input" do
    got =
      File.read!("./data/day1.txt")
      |> Aoc17.Day1.part2()

    expected = 1238
    assert expected == got
  end
end
