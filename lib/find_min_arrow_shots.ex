defmodule FindMinArrowShots do
  @doc """
      iex> FindMinArrowShots.solve([[10,16],[2,8],[1,6],[7,12]])
      2

      iex> FindMinArrowShots.solve([[1,2],[3,4],[5,6],[7,8]])
      4

      iex> FindMinArrowShots.solve([[1,2],[2,3],[3,4],[4,5]])
      2
  """
  @spec solve(points :: [[integer]]) :: integer
  def solve(points) do
    points
    |> Enum.sort_by(fn [_, e] -> e end)
    |> do_solve(-100000000000000, 0)
  end

  def do_solve([], _, res), do: res
  def do_solve([[hs, he] | rest], en, res) when hs > en, do: do_solve(rest, he, res + 1)
  def do_solve([_ | rest], en, res), do: do_solve(rest, en, res)
end
