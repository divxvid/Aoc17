defmodule Aoc17.Day3 do
  @type gridmap :: %{{integer(), integer()} => integer()}

  @spec part1(integer()) :: integer()
  def part1(1), do: 0

  def part1(input) do
    {ring_start, rowsize} =
      Enum.reduce_while(0..10000, {1, 2}, fn _, {acc, rowsize} ->
        ring_size = 4 * rowsize

        if acc + ring_size < input do
          {:cont, {acc + ring_size, rowsize + 2}}
        else
          {:halt, {acc + 1, rowsize}}
        end
      end)

    delta = input - ring_start

    get_number(div(rowsize, 2), rem(delta, rowsize))
  end

  @spec part2(integer()) :: integer()
  def part2(1), do: 2

  def part2(input) do
    grid = %{{0, 0} => 1}

    Enum.reduce_while(0..10, {2, grid, {0, 1}}, fn _, {seg_len, grid, {s_x, s_y}} ->
      # going up
      {{new_x, new_y}, grid, val} =
        Enum.reduce_while(0..(seg_len - 1), {{s_x, s_y}, grid}, fn i, {{x, y}, grid} ->
          val = sum_of_neighbors(x, y, grid)

          cond do
            val > input -> {:halt, {{x + 1, y}, Map.put(grid, {x, y}, val), val}}
            i == seg_len - 1 -> {:halt, {{x + 1, y}, Map.put(grid, {x, y}, val), -1}}
            true -> {:cont, {{x + 1, y}, Map.put(grid, {x, y}, val)}}
          end
        end)

      if val != -1 do
        {:halt, val}
      else
        # going left
        {{new_x, new_y}, grid, val} =
          Enum.reduce_while(0..(seg_len - 1), {{new_x - 1, new_y - 1}, grid}, fn i,
                                                                                 {{x, y}, grid} ->
            val = sum_of_neighbors(x, y, grid)

            cond do
              val > input -> {:halt, {{x, y - 1}, Map.put(grid, {x, y}, val), val}}
              i == seg_len - 1 -> {:halt, {{x, y - 1}, Map.put(grid, {x, y}, val), -1}}
              true -> {:cont, {{x, y - 1}, Map.put(grid, {x, y}, val)}}
            end
          end)

        if val != -1 do
          {:halt, val}
        else
          # going down
          {{new_x, new_y}, grid, val} =
            Enum.reduce_while(0..(seg_len - 1), {{new_x - 1, new_y + 1}, grid}, fn i,
                                                                                   {{x, y}, grid} ->
              val = sum_of_neighbors(x, y, grid)

              cond do
                val > input -> {:halt, {{x - 1, y}, Map.put(grid, {x, y}, val), val}}
                i == seg_len - 1 -> {:halt, {{x - 1, y}, Map.put(grid, {x, y}, val), -1}}
                true -> {:cont, {{x - 1, y}, Map.put(grid, {x, y}, val)}}
              end
            end)

          if val != -1 do
            {:halt, val}
          else
            # going right
            {{new_x, new_y}, grid, val} =
              Enum.reduce_while(0..(seg_len - 1), {{new_x + 1, new_y + 1}, grid}, fn i,
                                                                                     {{x, y},
                                                                                      grid} ->
                val = sum_of_neighbors(x, y, grid)

                cond do
                  val > input -> {:halt, {{x, y + 1}, Map.put(grid, {x, y}, val), val}}
                  i == seg_len - 1 -> {:halt, {{x, y + 1}, Map.put(grid, {x, y}, val), -1}}
                  true -> {:cont, {{x, y + 1}, Map.put(grid, {x, y}, val)}}
                end
              end)

            if val != -1 do
              {:halt, val}
            else
              {:cont, {seg_len + 2, grid, {new_x, new_y}}}
            end
          end
        end
      end
    end)
  end

  @spec sum_of_neighbors(integer(), integer(), gridmap) :: integer()
  defp sum_of_neighbors(x, y, grid) do
    [
      Map.get(grid, {x + 1, y}, 0),
      Map.get(grid, {x - 1, y}, 0),
      Map.get(grid, {x, y + 1}, 0),
      Map.get(grid, {x, y - 1}, 0),
      Map.get(grid, {x + 1, y + 1}, 0),
      Map.get(grid, {x + 1, y - 1}, 0),
      Map.get(grid, {x - 1, y + 1}, 0),
      Map.get(grid, {x - 1, y - 1}, 0)
    ]
    |> Enum.sum()
  end

  @spec get_number(integer(), integer()) :: integer()
  defp get_number(half, offset) do
    if offset < half do
      half + (half - 1 - offset)
    else
      offset + 1
    end
  end
end
