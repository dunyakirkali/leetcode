defmodule MaximumCountOfPositiveIntegerAndNegativeInteger do
  @doc """
      iex> MaximumCountOfPositiveIntegerAndNegativeInteger.solve([-2,-1,-1,1,2,3])
      3
      iex> MaximumCountOfPositiveIntegerAndNegativeInteger.solve([-3,-2,-1,0,0,1,2])
      3
      iex> MaximumCountOfPositiveIntegerAndNegativeInteger.solve([5,20,66,1314])
      4
  """
  @spec solve(nums :: [integer]) :: integer
  def maximum_count(nums) do
    nums
    |> Enum.reduce([0, 0], fn item, [less, more] ->
      cond do
        item < 0 -> [less + 1, more]
        item > 0 -> [less, more + 1]
        true -> [less, more]
      end
    end)
    |> Enum.max
  end
end
