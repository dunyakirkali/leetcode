defmodule LengthOfLastWord do
  @spec solve(s :: String.t) :: integer
  @doc """
      iex> LengthOfLastWord.solve("Hello World")
      5

      iex> LengthOfLastWord.solve("   fly me   to   the moon  ")
      4

      iex> LengthOfLastWord.solve("luffy is still joyboy")
      6
  """
  def solve(s) do
    s
    |> String.trim()
    |> String.split(" ")
    |> List.last()
    |> String.length()
  end
end
