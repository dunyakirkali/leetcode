defmodule FindMin do
  @doc """
      iex> FindMin.solve([3,4,5,1,2])
      1

      iex> FindMin.solve([4,5,6,7,0,1,2])
      0

      iex> FindMin.solve([11,13,15,17])
      11
  """
  @spec solve(nums :: [integer]) :: integer
  def solve(nums) do
    f = List.first(nums)
    l = List.last(nums)
    if l > f do
      f
    else
      nums
      |> Enum.reverse()
      |> do_solve()
    end
  end

  def do_solve([h]), do: h
  def do_solve([h, n | t]) do
    if h > n do
      do_solve([n | t])
    else
      h
    end
  end
end
