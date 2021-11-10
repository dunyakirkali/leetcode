defmodule ValidPalindrome do
  @doc """
      iex> ValidPalindrome.solve("A man, a plan, a canal: Panama")
      true

      iex> ValidPalindrome.solve("race a car")
      false

      iex> ValidPalindrome.solve(" ")
      true

      iex> ValidPalindrome.solve("0P")
      false
  """
  @spec solve(s :: String.t) :: boolean
  def solve(s) do
    s
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.filter(&(&1 in 97..122 or &1 in 48..57))
    |> List.to_string
    |> sanitize(<<>>)
    |> do_solve()
  end

  defp sanitize(<<>>, acc), do: acc
  defp sanitize(<<" ", rest::binary>>, acc), do: sanitize(rest, acc)
  defp sanitize(<<char::8, rest::binary>>, acc) do
    sanitize(rest, << acc::binary, char >>)
  end

  defp do_solve(<<>>), do: true
  defp do_solve(<<_::8>>), do: true
  defp do_solve(<<head::8, rest::binary>>) do
    <<tail::8, rest::binary>> = reverse(rest)
    if head == tail do
      do_solve(rest)
    else
      false
    end
  end

  defp reverse(binary) do
    binary |> :binary.decode_unsigned(:little) |> :binary.encode_unsigned(:big)
  end
end
