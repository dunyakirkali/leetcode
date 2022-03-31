defmodule SplitArray do
  @doc """
      iex> SplitArray.solve([7,2,5,10,8], 2)
      18

      iex> SplitArray.solve([1,2,3,4,5], 2)
      9

      iex> SplitArray.solve([1,4,4], 3)
      4
  """
  @spec solve(nums :: [integer], m :: integer) :: integer
  def solve(nums, m) do
    max_result = Enum.sum(nums)
    min_result = Enum.max(nums)

    do_solve(nums, min_result, max_result, 100000000000000000000, m)
  end

  def do_solve(_, min_result, max_result, final_result, _) when min_result > max_result, do: final_result
  def do_solve(nums, min_result, max_result, final_result, m) do
    mid = div(min_result + max_result, 2)
    if possible(nums, mid, m) do
      do_solve(nums, min_result, mid - 1, mid, m)
    else
      do_solve(nums, mid + 1, max_result, final_result, m)
    end
  end

  def possible(nums, mid, m) do
    count = do_possible(nums, mid, 1, 0)
    count <= m
  end

  def do_possible([], _, subarray_count, _), do: subarray_count
  def do_possible([h | t], mid, subarray_count, subarray_sum) do
    if h + subarray_sum <= mid do
      do_possible(t, mid, subarray_count, h + subarray_sum)
    else
      do_possible(t, mid, subarray_count + 1, h)
    end
  end
end
