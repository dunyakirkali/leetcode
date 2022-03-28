defmodule SearchThree do
  @doc """
      iex> SearchThree.solve([4,5,6,7,0,1,2], 0)
      4

      iex> SearchThree.solve([4,5,6,7,0,1,2], 3)
      -1

      iex> SearchThree.solve([1], 0)
      -1
  """
  @spec solve(nums :: [integer], target :: integer) :: boolean
  def solve(nums, target) do
    nums
    |> Enum.with_index()
    |> do_solve(target)
  end

  def do_solve([], _), do: -1
  def do_solve([{target, pos} | _], target), do: pos
  def do_solve([{h, _} | t], target) do
    if h > target do
      t
      |> Enum.reverse
      |> do_solve(target)
    else
      t
      |> do_solve(target)
    end
  end
end
