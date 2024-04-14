defmodule Aoc17.Day2 do
  @spec part1(String.t()) :: integer
  def part1(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce(0, fn row, acc ->
      data =
        row
        |> String.split()
        |> Enum.map(&String.to_integer/1)

      min = Enum.min(data)
      max = Enum.max(data)

      acc + (max - min)
    end)
  end

  @spec part2(String.t()) :: integer
  def part2(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce(0, fn row, acc ->
      int_row =
        row
        |> String.split()
        |> Enum.map(&String.to_integer/1)

      quotient = find_divisible_elements(int_row)

      acc + quotient
    end)
  end

  @spec find_divisible_elements([integer]) :: integer
  defp find_divisible_elements([]), do: 0
  defp find_divisible_elements([_]), do: 0

  defp find_divisible_elements([element | rest]) do
    result =
      Enum.reduce_while(rest, :ouch, fn x, _ ->
        mn = min(element, x)
        mx = max(element, x)

        case rem(mx, mn) do
          0 -> {:halt, div(mx, mn)}
          _ -> {:cont, :ouch}
        end
      end)

    case result do
      :ouch -> find_divisible_elements(rest)
      x -> x
    end
  end
end
