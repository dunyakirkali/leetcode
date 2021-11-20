defmodule SingleNonDuplicate do
  @doc """
      iex> SingleNonDuplicate.solve([1,1,2,3,3,4,4,8,8])
      2

      iex> SingleNonDuplicate.solve([3,3,7,7,10,11,11])
      10
  """
  @spec solve(nums :: [integer]) :: integer
  def solve(nums) do
    do_solve(nums, %{})
    |> Map.keys()
    |> Enum.at(0)
  end

  defp do_solve([], acc), do: acc
  defp do_solve([h | t], acc) do
    acc =
      if Map.get(acc, h) do
        Map.delete(acc, h)
      else
        Map.put(acc, h, true)
      end
    do_solve(t, acc)
  end
end
