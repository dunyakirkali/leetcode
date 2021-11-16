defmodule LetterCombinationsOfAPhoneNumber do
  @chars %{
    ?2 => ["a", "b", "c"],
    ?3 => ["d", "e", "f"],
    ?4 => ["g", "h", "i"],
    ?5 => ["j", "k", "l"],
    ?6 => ["m", "n", "o"],
    ?7 => ["p", "q", "r", "s"],
    ?8 => ["t", "u", "v"],
    ?9 => ["w", "x", "y", "z"]
  }
  @doc """
      iex> LetterCombinationsOfAPhoneNumber.solve("23")
      ["ad","ae","af","bd","be","bf","cd","ce","cf"]

      iex> LetterCombinationsOfAPhoneNumber.solve("")
      []

      iex> LetterCombinationsOfAPhoneNumber.solve("2")
      ["a","b","c"]
  """
  @spec solve(digits :: String.t) :: [String.t]
  def solve(""), do: []
  def solve(digits) do
    len = String.length(digits)
    digits
    |> do_letter_combinations([])
    |> List.flatten()
    |> Enum.chunk_every(len, len)
    |> Enum.sort()
    |> Enum.map(fn list ->
      list
      |> Enum.join()
    end)
  end

  defp do_letter_combinations(<<>>, acc), do: acc
  defp do_letter_combinations(<<digit::size(8), rest::binary>>, acc) do
    @chars[digit]
    |> Enum.map(fn char ->
      rest
      |> do_letter_combinations([char | acc])
      |> Enum.reverse()
    end)
  end
end
