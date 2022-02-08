defmodule AddDigits do
  @doc """
      iex> AddDigits.solve(38)
      2

      iex> AddDigits.solve(0)
      0
  """
  @spec solve(num :: integer) :: integer
  def solve(num) do
    num
    |> Integer.digits()
    |> sum
  end

  def sum([digit]), do: digit
  def sum(digits) do
    digits
    |> Enum.sum()
    |> Integer.digits()
    |> sum()
  end
end
