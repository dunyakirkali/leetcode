defmodule ClimbingStairs do
  use Agent

  def start do
    Agent.start_link(fn -> %{0 => 0, 1 => 1, 2 => 2} end, name: __MODULE__)
  end

  @spec solve(n :: integer) :: integer
  @doc """
      iex> ClimbingStairs.solve(2)
      2

      iex> ClimbingStairs.solve(3)
      3

      iex> ClimbingStairs.solve(44)
      1134903170
  """
  def solve(n) do
    start()
    do_solve(n)
  end

  defp do_solve(n) do
    cached_value = Agent.get(__MODULE__, &(Map.get(&1, n)))

    if cached_value do
      cached_value
    else
      res = do_solve(n - 1) + do_solve(n - 2)
      Agent.update(__MODULE__, &(Map.put(&1, n, res)))
      res
    end
  end
end
