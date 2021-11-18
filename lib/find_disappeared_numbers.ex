defmodule FindDisappearedNumbers do
  @doc """
      iex> FindDisappearedNumbers.solve([4,3,2,7,8,2,3,1])
      [5, 6]

      iex> FindDisappearedNumbers.solve([1,1])
      [2]
  """
  @spec solve(nums :: [integer]) :: [integer]
  def solve(nums) do
    n = Enum.count(nums)

    1..n
    |> MapSet.new()
    |> MapSet.difference(MapSet.new(nums))
    |> MapSet.to_list()
  end
end
