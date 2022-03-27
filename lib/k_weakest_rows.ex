defmodule KWeakestRows do
  @doc """
      iex> KWeakestRows.solve([[1,1,0,0,0], [1,1,1,1,0], [1,0,0,0,0], [1,1,0,0,0], [1,1,1,1,1]], 3)
      [2,0,3]

      iex> KWeakestRows.solve([[1,0,0,0], [1,1,1,1], [1,0,0,0], [1,0,0,0]], 2)
      [0,2]
  """
  @spec solve(mat :: [[integer]], k :: integer) :: [integer]
  def solve(mat, k) do
    mat
    |> Enum.map(fn row ->
      Enum.sum(row)
    end)
    |> Enum.with_index()
    |> Enum.sort_by(fn {val, _} ->
      val
    end)
    |> Enum.take(k)
    |> Enum.map(fn {_, pos} ->
      pos
    end)
  end
end
