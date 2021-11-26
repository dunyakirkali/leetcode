defmodule MaxProfit do
  @doc """
      iex> MaxProfit.solve([7,1,5,3,6,4])
      5

      iex> MaxProfit.solve([7,6,4,3,1])
      0
  """
  @spec solve(prices :: [integer]) :: integer
  def solve(prices) do
    lowest = List.first(prices)
    do_solve(prices, lowest, 0)
  end

  defp do_solve([], _, profit), do: profit
  defp do_solve([h | t], lowest, profit) do
    do_solve(t, min(lowest, h), max(profit, h - lowest))
  end
end
