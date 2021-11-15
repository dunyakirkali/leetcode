defmodule  SearchInsertPosition do
  @doc """
      iex> SearchInsertPosition.solve([1,3,5,6], 5)
      2

      iex> SearchInsertPosition.solve([1,3,5,6], 2)
      1

      iex> SearchInsertPosition.solve([1,3,5,6], 7)
      4

      iex> SearchInsertPosition.solve([1,3,5,6], 0)
      0

      iex> SearchInsertPosition.solve([1], 0)
      0
  """
  @spec solve(nums :: [integer], target :: integer) :: integer
  def solve(nums, target) do
    nums
    |> Enum.with_index()
    |> do_solve(target)
  end

  defp do_solve([], _), do: 0
  defp do_solve([{item, index}], target) when item < target, do: index + 1
  defp do_solve([{item, index}], target) when item > target, do: index
  defp do_solve(nums, target) do
    mid_index = div(length(nums), 2)
    {low, [mid | high]} = Enum.split(nums, mid_index)

    if target > elem(mid, 0) do
      do_solve([mid | high], target)
    else
      do_solve(low, target)
    end
  end
end
