defmodule RomanToInteger do
  @values %{
    ?I => 1,
    ?V => 5,
    ?X => 10,
    ?L => 50,
    ?C => 100,
    ?D => 500,
    ?M => 1000
  }
  @doc """
      iex> RomanToInteger.solve("III")
      3

      iex> RomanToInteger.solve("IV")
      4

      iex> RomanToInteger.solve("IX")
      9

      iex> RomanToInteger.solve("LVIII")
      58

      iex> RomanToInteger.solve("MCMXCIV")
      1994
  """
  @spec solve(s :: String.t) :: integer
  def solve(s) do
    s
    |> do_solve(0)
  end

  defp do_solve(<<>>, acc), do: acc
  defp do_solve(<<"IV", t::binary>>, acc) do
    do_solve(t, acc + 4)
  end
  defp do_solve(<<"IX", t::binary>>, acc) do
    do_solve(t, acc + 9)
  end
  defp do_solve(<<"XL", t::binary>>, acc) do
    do_solve(t, acc + 40)
  end
  defp do_solve(<<"XC", t::binary>>, acc) do
    do_solve(t, acc + 90)
  end
  defp do_solve(<<"CD", t::binary>>, acc) do
    do_solve(t, acc + 400)
  end
  defp do_solve(<<"CM", t::binary>>, acc) do
    do_solve(t, acc + 900)
  end
  defp do_solve(<<h::utf8, t::binary>>, acc) do
    do_solve(t, acc + @values[h])
  end
end
