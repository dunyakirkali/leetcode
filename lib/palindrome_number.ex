defmodule PalindromeNumber do
  @doc """
      iex> PalindromeNumber.solve(121)
      true

      iex> PalindromeNumber.solve(-121)
      false

      iex> PalindromeNumber.solve(10)
      false

      iex> PalindromeNumber.solve(-101)
      false
  """
  @spec solve(x :: integer) :: boolean
  def solve(x) when x < 0, do: false
  def solve(x) when x >= 0 do
    x
    |> Integer.digits
    |> do_solve()
  end

  defp do_solve(list) when length(list) == 1, do: true
  defp do_solve([]), do: true
  defp do_solve([h | t]) do
    [last | rest] = Enum.reverse(t)
    if h == last do
      do_solve(rest)
    else
      false
    end
  end
end
