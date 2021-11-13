defmodule Sqrt do
  @spec solve(x :: integer) :: integer
  @doc """
      iex> Sqrt.solve(4)
      2

      iex> Sqrt.solve(8)
      2
  """
  def solve(x) do
    1
    |> Stream.iterate(&(&1 + 1))
    |> Stream.drop_while(&(&1 * &1 <= x))
    |> Enum.take(1)
    |> List.first()
    |> Kernel.-(1)
  end
end
