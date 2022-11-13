defmodule SingleNumber do
  @doc """
      iex> SingleNumber.solve([2,2,1])
      1

      iex> SingleNumber.solve([4,1,2,1,2])
      4

      iex> SingleNumber.solve([1])
      1
  """
  @spec solve(nums :: [integer]) :: integer
  def solve(nums) do
    nums
    |> Enum.frequencies()
    |> Enum.find(fn {_, v} ->
      v == 1
    end)
    |> elem(0)
  end
end
