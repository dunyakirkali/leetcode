defmodule MaximumWealth do
  @doc """
      iex> MaximumWealth.solve([[1,2,3],[3,2,1]])
      6

      iex> MaximumWealth.solve([[1,5],[7,3],[3,5]])
      10

      iex> MaximumWealth.solve([[2,8,7],[7,1,3],[1,9,5]])
      17
  """
  @spec solve(accounts :: [[integer]]) :: integer
  def solve(accounts) do
    accounts
    |> Enum.max_by(fn banks ->
      Enum.sum(banks)
    end)
    |> Enum.sum
  end
end
