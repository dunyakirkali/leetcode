defmodule Permute do
  @doc """
      iex> Permute.solve([1,2,3])
      [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

      iex> Permute.solve([0,1])
      [[0,1],[1,0]]

      iex> Permute.solve([1])
      [[1]]
  """
  @spec solve(nums :: [integer]) :: [[integer]]
  def solve([]), do: [[]]
  def solve(list), do: for elem <- list, rest <- solve(list--[elem]), do: [elem|rest]
end
