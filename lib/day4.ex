defmodule Aoc17.Day4 do
  @spec part1(String.t()) :: integer()
  def part1(input) do
    input
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      {_, bad?} =
        line
        |> String.split(" ", trim: true)
        |> Enum.reduce({MapSet.new(), false}, fn word, {seen, bad?} ->
          cond do
            bad? -> {seen, true}
            MapSet.member?(seen, word) -> {seen, true}
            true -> {MapSet.put(seen, word), false}
          end
        end)

      cond do
        bad? -> 0
        true -> 1
      end
    end)
    |> Enum.sum()
  end

  @spec part2(String.t()) :: integer()
  def part2(input) do
    input
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(&is_valid?/1)
    |> Enum.filter(& &1)
    |> Enum.count()
  end

  @spec is_valid?(String.t()) :: boolean()
  def is_valid?(line) do
    {_, bad?} =
      line
      |> String.split(" ", trim: true)
      |> Enum.reduce({MapSet.new(), false}, fn word, {seen, bad?} ->
        word =
          word
          |> String.to_charlist()
          |> Enum.sort()
          |> List.to_string()

        cond do
          bad? -> {seen, true}
          MapSet.member?(seen, word) -> {seen, true}
          true -> {MapSet.put(seen, word), false}
        end
      end)

    !bad?
  end
end
