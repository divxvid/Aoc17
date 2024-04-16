defmodule Aoc17.Day4Test do
  use ExUnit.Case

  @tag :skip
  test "sample part1" do
    input = "
      aa bb cc dd ee
      aa bb cc dd aa
      aa bb cc dd aaa
      "

    expected = 2
    got = Aoc17.Day4.part1(input)
    assert expected == got
  end

  @tag :skip
  test "input part1" do
    input = File.read!("./data/day4.txt")

    expected = 325
    got = Aoc17.Day4.part1(input)
    assert expected == got
  end

  @tag :skip
  test "part2: line is valid passphrase" do
    test_data = %{
      "abcde fghij" => true,
      "abcde xyz ecdab" => false,
      "a ab abc abd abf abj" => true,
      "iiii oiii ooii oooi oooo" => true,
      "oiii ioii iioi iiio" => false
    }

    Enum.each(test_data, fn {input, expected} ->
      got = Aoc17.Day4.is_valid?(input)
      assert {input, expected} == {input, got}
    end)
  end

  @tag :skip
  test "input part2" do
    input = File.read!("./data/day4.txt")

    expected = 119
    got = Aoc17.Day4.part2(input)
    assert expected == got
  end
end
