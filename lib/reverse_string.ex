defmodule ReverseString do
  @doc """
      iex> ReverseString.solve(["h","e","l","l","o"])
      ["o","l","l","e","h"]

      iex> ReverseString.solve(["H","a","n","n","a","h"])
      ["h","a","n","n","a","H"]
  """
  def solve(x) do
    do_solve(x, [])
  end

  def do_solve([], acc), do: acc
  def do_solve([h | t], acc) do
    do_solve(t, [h | acc])
  end
end
