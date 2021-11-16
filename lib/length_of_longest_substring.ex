defmodule LengthOfLongestSubstring do
  @doc """
      iex> LengthOfLongestSubstring.solve("abcabcbb")
      3

      iex> LengthOfLongestSubstring.solve("bbbbb")
      1

      iex> LengthOfLongestSubstring.solve("pwwkew")
      3

      iex> LengthOfLongestSubstring.solve("")
      0
  """
  @spec solve(s :: String.t) :: integer
  def solve(s) do
    do_solve(s, 0)
  end

  defp do_solve(<<>>, acc), do: acc
  defp do_solve(<<h::size(8), t::binary>>, acc) do
    count =
      t
      |> do_count(%{h => true})
      |> map_size

    do_solve(t, max(acc, count))
  end

  defp do_count(<<>>, hsh), do: hsh
  defp do_count(<<char::size(8), rest::binary>>, hsh) do
    if Map.has_key?(hsh, char) do
      hsh
    else
      do_count(rest, Map.put(hsh, char, true))
    end
  end
end
