defmodule GetRow do
  @doc """
      iex> GetRow.solve(0)
      [1]

      iex> GetRow.solve(1)
      [1,1]

      iex> GetRow.solve(3)
      [1,3,3,1]
  """
  @spec solve(row_index :: integer) :: [integer]
  def solve(row_index) do
    do_solve(row_index)
  end

  defp do_solve(0), do: [1]
  defp do_solve(1), do: [1, 1]
  defp do_solve(row) do
    prev = do_solve(row - 1)

    next =
      prev
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.reduce([], fn [l, r], acc ->
        [l + r | acc]
      end)

    [1, next, 1]
    |> List.flatten()
  end
end
