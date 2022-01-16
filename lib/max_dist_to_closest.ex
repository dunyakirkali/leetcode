defmodule MaxDistToClosest do
  @doc """
      iex> MaxDistToClosest.solve([1,0,0,0,1,0,1])
      2

      iex> MaxDistToClosest.solve([1,0,0,0])
      3

      iex> MaxDistToClosest.solve([0,1])
      1
  """
  @spec solve(seats :: [integer]) :: integer
  def solve(seats) do
    do_solve(Enum.with_index(seats), length(seats), 0, -1)
  end

  def do_solve([], n, result, last), do: max(result, n - last - 1)
  def do_solve([{0, _} | t], n, result, last), do: do_solve(t, n, result, last)
  def do_solve([{1, index} | t], n, result, last) when last < 0, do: do_solve(t, n, max(result, index), index)
  def do_solve([{1, index} | t], n, result, last) when last >= 0, do: do_solve(t, n, max(result, div(index - last, 2)), index)
end
