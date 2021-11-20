defmodule HammingDistance do
  @doc """
      iex> HammingDistance.solve(1, 4)
      2

      iex> HammingDistance.solve(3, 1)
      1
  """
  @spec solve(x :: integer, y :: integer) :: integer
  def solve(x, y) do
    xb = Integer.digits(x, 2) |> Enum.reverse()
    yb = Integer.digits(y, 2) |> Enum.reverse()

    do_solve(xb, yb, 0)
  end

  defp do_solve([], [], acc), do: acc
  defp do_solve([], [ybh | ybt], acc) do
    if ybh != 0 do
      do_solve([], ybt, acc + 1)
    else
      do_solve([], ybt, acc)
    end
  end
  defp do_solve([xbh | xbt], [], acc) do
    if xbh != 0 do
      do_solve(xbt, [], acc + 1)
    else
      do_solve(xbt, [], acc)
    end
  end
  defp do_solve([xbh | xbt], [ybh | ybt], acc) do
    if xbh != ybh do
      do_solve(xbt, ybt, acc + 1)
    else
      do_solve(xbt, ybt, acc)
    end
  end
end
