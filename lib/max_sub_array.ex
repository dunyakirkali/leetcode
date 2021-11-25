defmodule MaxSubArray do
  @doc """
      iex> MaxSubArray.solve([-2,1,-3,4,-1,2,1,-5,4])
      6

      iex> MaxSubArray.solve([1])
      1

      iex> MaxSubArray.solve([5,4,-1,7,8])
      23
  """
  @spec solve(nums :: [integer]) :: integer
  def solve(nums) do
    do_solve(nums, 0, -1_000_000)
  end

  defp do_solve([], _, ans), do: ans
  defp do_solve([h | t], sum, ans) do
    sum = sum + h
    ans = max(sum, ans)
    sum =
      if sum < 0 do
        0
      else
        sum
      end
    do_solve(t, sum, ans)
  end
end
