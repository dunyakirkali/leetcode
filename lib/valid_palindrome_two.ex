defmodule ValidPalindromeTwo do
  @doc """
      iex> ValidPalindromeTwo.solve("aba")
      true

      iex> ValidPalindromeTwo.solve("abca")
      true

      iex> ValidPalindromeTwo.solve("abc")
      false

      iex> ValidPalindromeTwo.solve("bddb")
      true
  """
  @spec solve(s :: String.t) :: boolean
  def solve(s) do
    s
    |> String.to_charlist()
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {val, ind}, acc ->
      Map.put(acc, ind, val)
    end)
    |> is_palindrome()
  end

  def is_palindrome(cl) do
    do_is_palindrome(cl, 0, map_size(cl) - 1, false)
  end

  def do_is_palindrome(_, left, right, _) when left >= right, do: true
  def do_is_palindrome(cl, left, right, skipped) do
    if Map.get(cl, left) == Map.get(cl, right) do
      do_is_palindrome(cl, left + 1, right - 1, skipped)
    else
      if skipped do
        false
      else
        do_is_palindrome(cl, left + 1, right, true) or do_is_palindrome(cl, left, right - 1, true)
      end
    end
  end
end
