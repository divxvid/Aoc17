defmodule Aoc17.Day1 do
  @spec part1(String.t()) :: integer
  def part1(input) do
    input = String.trim(input)
    first_ch = String.at(input, 0)
    input = input <> first_ch
    input = String.to_charlist(input)

    Enum.zip(input, Enum.drop(input, 1))
    |> Enum.reduce(0, fn {last, curr}, acc ->
      cond do
        last == curr -> acc + (last - ?0)
        true -> acc
      end
    end)
  end

  @spec part2(String.t()) :: integer
  def part2(input) do
    input
  end
end
