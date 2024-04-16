defmodule Aoc17.Day5 do
  @spec part1(String.t()) :: integer()
  def part1(input) do
    data =
      input
      |> String.trim()
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> :array.from_list()

    jump_around(data, 0, :array.size(data))
  end

  @spec part2(String.t()) :: integer()
  def part2(input) do
    data =
      input
      |> String.trim()
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> :array.from_list()

    jump_around_weird(data, 0, :array.size(data))
  end

  @spec jump_around(any(), integer(), integer()) :: integer()
  defp jump_around(_, idx, sz) when idx >= sz, do: 0

  defp jump_around(a, idx, sz) when idx < sz do
    offset = :array.get(idx, a)
    a = :array.set(idx, offset + 1, a)
    1 + jump_around(a, idx + offset, sz)
  end

  @spec jump_around_weird(any(), integer(), integer()) :: integer()
  defp jump_around_weird(_, idx, sz) when idx >= sz, do: 0

  defp jump_around_weird(a, idx, sz) when idx < sz do
    offset = :array.get(idx, a)

    a =
      cond do
        offset >= 3 -> :array.set(idx, offset - 1, a)
        true -> :array.set(idx, offset + 1, a)
      end

    1 + jump_around_weird(a, idx + offset, sz)
  end
end
