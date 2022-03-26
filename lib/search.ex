defmodule Search do
  @doc """
      iex> Search.solve([-1,0,3,5,9,12], 9)
      4

      iex> Search.solve([-1,0,3,5,9,12], 2)
      -1
  """
  @spec solve(nums :: [integer], target :: integer) :: integer
  def solve(nums, target) do
    nums
    |> Enum.with_index()
    |> do_search(target)
  end

  def do_search([], _), do: -1
  def do_search([{target, pos}], target), do: pos
  def do_search(list, target) do
    mid = round(length(list)/2)
    {l, r} = Enum.split(list, mid)
    le = Enum.map(l, fn {i, _} -> i end)

    if Enum.member?(le, target) do
      do_search(l, target)
    else
      do_search(r, target)
    end
  end
end
