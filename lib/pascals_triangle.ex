defmodule PascalsTriangle do
  @spec solve(num_rows :: integer) :: [[integer]]
  @doc """
      # iex> PascalsTriangle.solve(1)
      # [[1]]

      # iex> PascalsTriangle.solve(2)
      # [[1],[1,1]]

      iex> PascalsTriangle.solve(3)
      [[1],[1,1],[1,2,1]]

      iex> PascalsTriangle.solve(4)
      [[1],[1,1],[1,2,1],[1,3,3,1]]

      iex> PascalsTriangle.solve(5)
      [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
  """
  def solve(num_rows) do
    do_solve(num_rows)
    |> Enum.reverse()
  end

  defp do_solve(1), do: [[1]]
  defp do_solve(2), do: [[1, 1], [1]]
  defp do_solve(row) do
    acc = [h | _] = do_solve(row - 1)

    nr =
      h
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.reduce([], fn [l, r], acc ->
        [l + r | acc]
      end)

    nl =
      [1, nr, 1]
      |> List.flatten()

    [nl | acc]
  end
end
