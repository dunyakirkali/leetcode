defmodule UniquePaths do
  use Agent

  def start do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @doc """
      iex> UniquePaths.solve(3, 7)
      28

      iex> UniquePaths.solve(2, 2)
      2

      iex> UniquePaths.solve(3, 2)
      3

      iex> UniquePaths.solve(2, 3)
      3

      iex> UniquePaths.solve(3, 3)
      6
  """
  @spec solve(m :: integer, n :: integer) :: integer
  def solve(m, n) do
    start()
    res = do_solve(m, n, {0, 0})
    Agent.update(__MODULE__, fn _x ->
      %{}
    end)
    res
  end

  defp do_solve(m, n, {x, y}) when m - 1 == y and n - 1 == x, do: 1
  defp do_solve(m, n, {x, y}) when m == y or n == x, do: 0

  defp do_solve(m, n, {x, y}) do
    cached_value = Agent.get(__MODULE__, &Map.get(&1, {x, y}))

    if cached_value do
      cached_value
    else
      x_steps = do_solve(m, n, {x + 1, y})
      y_steps = do_solve(m, n, {x, y + 1})
      result = x_steps + y_steps
      Agent.update(__MODULE__, &Map.put(&1, {x, y}, result))
      result
    end
  end
end
