defmodule ReverseInteger do
  @spec solve(x :: integer) :: integer
  @doc """
      iex> ReverseInteger.solve(123)
      321

      iex> ReverseInteger.solve(-123)
      -321

      iex> ReverseInteger.solve(120)
      21

      iex> ReverseInteger.solve(0)
      0

      iex> ReverseInteger.solve(1534236469)
  """
  def solve(x) do
    rev =
      x
      |> Integer.digits()
      |> Enum.reverse()
      |> Integer.undigits()

    cond do
      rev > 2147483647 ->
        0
      rev < -2147483648 ->
        0
      true ->
        rev
    end
  end
end
