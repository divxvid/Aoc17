defmodule Aoc17.Day1Test do
  use ExUnit.Case

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

  test "part1 solution with actual input" do
    got =
      File.read!("./data/day1.txt")
      |> Aoc17.Day1.part1()

    expected = 1223
    assert expected == got
  end
end
