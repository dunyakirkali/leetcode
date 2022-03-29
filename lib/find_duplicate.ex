defmodule FindDuplicate do
  @doc """
      iex> FindDuplicate.solve([1,3,4,2,2])
      2

      iex> FindDuplicate.solve([3,1,3,4,2])
      3
  """
  @spec solve(nums :: [integer]) :: integer
  def solve(nums) do
    low = 1
    high = length(nums) - 1

    do_solve(nums, low, high, -1)
  end

  def do_solve(_nums, low, high, duplicate) when low > high, do: duplicate
  def do_solve(nums, low, high, duplicate) do
    cur = div(low + high, 2)
    count = Enum.count(nums, fn x -> x <= cur end)

    if count > cur do
      do_solve(nums, low, cur - 1, cur)
    else
      do_solve(nums, cur + 1, high, duplicate)
    end
  end
end
