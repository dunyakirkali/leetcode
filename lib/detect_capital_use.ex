defmodule DetectCapitalUse do
  @doc """
      iex> DetectCapitalUse.solve("USA")
      true

      iex> DetectCapitalUse.solve("leetcode")
      true

      iex> DetectCapitalUse.solve("Google")
      true

      iex> DetectCapitalUse.solve("FlaG")
      false
  """
  @spec solve(word :: String.t) :: boolean
  def solve(<<first::utf8, _::binary>> = word) do
    count = count_caps(word)
    cond do
      count == String.length(word) -> true
      count == 0 -> true
      count == 1 and caps?(first) -> true
      true -> false
    end
  end

  def count_caps(word) do
    word
    |> String.to_charlist()
    |> do_count_caps(0)
  end

  def do_count_caps([], count), do: count
  def do_count_caps([h | t], count) do
    if caps?(h) do
      do_count_caps(t, count + 1)
    else
      do_count_caps(t, count)
    end
  end

  def caps?(char) do
    Enum.member?(?A..?Z, char)
  end
end
