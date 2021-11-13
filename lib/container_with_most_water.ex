defmodule ContainerWithMostWater do
  @spec solve(height :: [integer]) :: integer
  @doc """
      iex> ContainerWithMostWater.solve([1,8,6,2,5,4,8,3,7])
      49

      iex> ContainerWithMostWater.solve([1,1])
      1

      iex> ContainerWithMostWater.solve([4,3,2,1,4])
      16

      iex> ContainerWithMostWater.solve([1,2,1])
      2
  """
  def solve(height) do
    height
    |> Enum.with_index()
    |> Map.new(fn {val, index} -> {index, {val, index}} end)
    |> do_solve([], 0, length(height) - 1)
    |> Enum.max()
  end

  defp do_solve(_, acc, lp, rp) when lp == rp, do: acc
  defp do_solve(map, acc, lp, rp) do
    {lh, li} = Map.get(map, lp)
    {rh, ri} = Map.get(map, rp)

    area = (ri - li) * min(lh, rh)

    if lh < rh do
      do_solve(map, [area | acc], lp + 1, rp)
    else
      do_solve(map, [area | acc], lp, rp - 1)
    end
  end
end
