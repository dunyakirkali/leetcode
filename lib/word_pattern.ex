defmodule WordPattern do
  @doc """
      iex> WordPattern.solve("abba", "dog cat cat dog")
      true

      iex> WordPattern.solve("abba", "dog cat cat fish")
      false

      iex> WordPattern.solve("aaaa", "dog cat cat dog")
      false

      iex> WordPattern.solve("abba", "dog dog dog dog")
      false
  """
  @spec solve(pattern :: String.t, s :: String.t) :: boolean
  def solve(pattern, s) do
    pattern = String.graphemes(pattern)
    words = String.split(s, " ", trim: true)
    do_solve(pattern, words, %{})
  end

  def do_solve(pattern, words, _) when length(pattern) != length(words), do: false
  def do_solve([], [], _), do: true
  def do_solve([ph | pt], [wh | wt], map) do
    if Map.has_key?(map, ph) do
      if Map.get(map, ph) == wh do
        do_solve(pt, wt, map)
      else
        false
      end
    else
      if Map.values(map) |> Enum.member?(wh) do
        false
      else
        map = Map.put(map, ph, wh)
        do_solve(pt, wt, map)
      end
    end
  end
end
