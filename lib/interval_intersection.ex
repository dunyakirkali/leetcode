defmodule IntervalIntersection do
  @doc """
      iex> IntervalIntersection.solve([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]])
      [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]

      iex> IntervalIntersection.solve([[1,3],[5,9]], [])
      []

      iex> IntervalIntersection.solve([], [[4,8],[10,12]])
      []

      iex> IntervalIntersection.solve([[1,7]], [[3,10]])
      [[3,7]]
  """
  @spec solve(first_list :: [[integer]], second_list :: [[integer]]) :: [[integer]]
  def solve(first_list, second_list) do
    do_solve(first_list, second_list, [])
    |> Enum.reverse
  end

  def do_solve([hf | tf] = first_list, [hs | ts] = second_list, acc) do
    [fs, fe] = hf
    [ss, se] = hs
    lo = max(fs, ss)
    hi = min(fe, se)

    acc =
      if lo <= hi do
        [[lo, hi] | acc]
      else
        acc
      end

    if fe < se do
      do_solve(tf, second_list, acc)
    else
      do_solve(first_list, ts, acc)
    end
  end
  def do_solve([], _second_list, acc), do: acc
  def do_solve(_first_list, [], acc), do: acc
end
