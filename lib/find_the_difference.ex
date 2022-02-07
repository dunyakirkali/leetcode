defmodule FindTheDifference do
  @doc """
      iex> FindTheDifference.solve("abcd", "abcde")
      ?e

      iex> FindTheDifference.solve("", "y")
      ?y
  """
  @spec solve(s :: String.t, t :: String.t) :: char
  def solve(s, t) do
    cs = s |> String.to_charlist() |> Enum.sort()
    ct = t |> String.to_charlist() |> Enum.sort()

    do_solve(cs, ct)
  end

  def do_solve([], [ht]), do: ht
  def do_solve([h | cst], [h | ctt]), do: do_solve(cst, ctt)
  def do_solve(_, [cth | _]), do: cth
end
