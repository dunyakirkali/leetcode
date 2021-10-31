defmodule TwoSum do
  @doc """
      iex> TwoSum.solve([2, 7, 11, 15], 9)
      [0, 1]

      iex> TwoSum.solve([3, 2, 4], 6)
      [1, 2]

      iex> TwoSum.solve([3, 3], 6)
      [0, 1]

      iex> TwoSum.solve(Enum.to_list(1..10000), 19999)
      [9998, 9999]
  """
  def solve(nums, target) do
    nums
    |> Stream.with_index()
    |> Enum.reduce_while(%{}, fn {num, index}, acc ->
      if p_index = Map.get(acc, target - num) do
        {:halt, [p_index, index]}
      else
        {:cont, Map.merge(acc, %{num => index})}
      end
    end)
  end
end
