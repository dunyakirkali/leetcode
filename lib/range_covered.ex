defmodule RangeCovered do
  @doc """
      iex> RangeCovered.solve([[1,2],[3,4],[5,6]], 2, 5)
      true

      iex> RangeCovered.solve([[1,10],[10,20]], 21, 21)
      false
  """
  @spec solve(ranges :: [[integer]], left :: integer, right :: integer) :: boolean
  def solve(ranges, left, right) do
    subset =
      Range.new(left, right)
      |> Enum.to_list
      |> MapSet.new

    space =
      ranges
      |> Enum.map(fn [s, e] ->
        Range.new(s, e)
        |> Enum.to_list
        |> MapSet.new
      end)
      |> Enum.reduce(MapSet.new, fn range, acc ->
        MapSet.union(acc, range)
      end)

    MapSet.intersection(space, subset) == subset
  end
end
