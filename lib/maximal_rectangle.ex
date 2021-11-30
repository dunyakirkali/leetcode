defmodule MaximalRectangle do
  @doc """
      iex> MaximalRectangle.solve( [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])
      6

      iex> MaximalRectangle.solve([])
      0

      iex> MaximalRectangle.solve([["0"]])
      0

      iex> MaximalRectangle.solve([["1"]])
      1

      iex> MaximalRectangle.solve([["0","0"]])
      0

      iex> MaximalRectangle.solve([["0","1"],["1","0"]])
      1

      iex> MaximalRectangle.solve([["1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","0"],["1","1","1","1","1","1","1","0"],["1","1","1","1","1","0","0","0"],["0","1","1","1","1","0","0","0"]])
      21
  """
  @spec solve(matrix :: [[char]]) :: integer
  def solve(matrix) do
    histogram =
      matrix
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {rows, y}, acc ->
        rows
        |> Enum.with_index()
        |> Enum.reduce(acc, fn {cell, x}, acc ->
          cell_val = String.to_integer(cell)
          if y == 0 do
            Map.put(acc, {x, y}, cell_val)
          else
            if cell_val == 0 do
              Map.put(acc, {x, y}, 0)
            else
              Map.put(acc, {x, y}, Map.get(acc, {x, y - 1}) + cell_val)
            end
          end
        end)
      end)

    0..(Enum.count(matrix) - 1)
    |> Enum.map(fn row ->
      histogram
      |> Enum.filter(fn {{_, y}, _} ->
        y == row
      end)
      |> Enum.sort_by(fn {{x, _}, _} ->
        x
      end)
      |> Enum.map(fn {_, val} ->
        val
      end)
    end)
    |> Enum.map(fn row ->
      LargestRectangleArea.solve(row)
    end)
    |> Enum.max
  end
end
