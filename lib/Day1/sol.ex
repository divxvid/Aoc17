defmodule Aoc17.Day1 do
  @spec part1(String.t()) :: integer
  def part1(input) do
    input = String.trim(input)
    first_ch = String.at(input, 0)

    (input <> first_ch)
    |> String.to_charlist()
    |> compute_matching_pairs(1)
  end

  @spec part2(String.t()) :: integer
  def part2(input) do
    input = String.trim(input)
    target_length = String.length(input) |> div(2)

    {left, _} = String.split_at(input, target_length)

    (input <> left)
    |> String.to_charlist()
    |> compute_matching_pairs(target_length)
  end

  @spec compute_matching_pairs(charlist(), integer) :: integer
  defp compute_matching_pairs(input, distance) do
    Enum.zip(input, Enum.drop(input, distance))
    |> Enum.reduce(0, fn {last, curr}, acc ->
      cond do
        last == curr -> acc + (last - ?0)
        true -> acc
      end
    end)
  end
end
