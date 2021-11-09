defmodule PlusOne do
  @doc """
      iex> PlusOne.solve([1,2,3])
      [1,2,4]

      iex> PlusOne.solve([4,3,2,1])
      [4,3,2,2]

      iex> PlusOne.solve([0])
      [1]

      iex> PlusOne.solve([9])
      [1,0]
  """
  @spec solve(digits :: [integer]) :: [integer]
  def solve(digits) do
    digits
    |> Enum.reverse()
    |> do_solve(1, [])
  end

  defp do_solve([], 0, acc), do: acc
  defp do_solve([], 1, acc), do: [1 | acc]
  defp do_solve([h | t], carry, acc) do
    sum = h + carry
    do_solve(t, div(sum, 10), [rem(sum, 10) | acc])
  end
end
