defmodule FindJudge do
  @doc """
      iex> FindJudge.solve(2, [[1,2]])
      2

      iex> FindJudge.solve(3, [[1,3],[2,3]])
      3

      iex> FindJudge.solve(3, [[1,3],[2,3],[3,1]])
      -1
  """
  @spec solve(n :: integer, trust :: [[integer]]) :: integer
  def solve(n, trust) do
    counter =
      for i <- 1..n, into: %{}  do
        {i, 0}
      end

    trust
    |> Enum.reduce(counter, fn [from, to], acc ->
        acc
        |> Map.update!(from, fn existing_value -> existing_value - 1 end)
        |> Map.update!(to, fn existing_value -> existing_value + 1 end)
      end)
    |> Enum.find(fn {_, trust_count} ->
      trust_count == n - 1
    end)
    |> case do
      nil -> -1
      {person, _} -> person
    end
  end
end
