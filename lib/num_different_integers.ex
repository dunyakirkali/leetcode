defmodule NumDifferentIntegers do
  @doc """
      iex> NumDifferentIntegers.solve("a123bc34d8ef34")
      3

      iex> NumDifferentIntegers.solve("leet1234code234")
      2

      iex> NumDifferentIntegers.solve("a1b01c001")
      1

      iex> NumDifferentIntegers.solve("0a0")
      1
  """
  @spec solve(word :: String.t()) :: integer
  def solve(word) do
    word
    |> String.graphemes()
    |> do_solve([], [])
    |> Enum.uniq()
    |> Enum.count()
  end

  defp do_solve([], _, acc) do
    acc
    |> Enum.filter(fn l ->
      not Enum.empty?(l)
    end)
    |> Enum.map(fn set ->
      set
      |> Enum.reverse()
      |> Integer.undigits()
    end)
  end

  defp do_solve([l], collected, acc) do
    case Integer.parse(l) do
      :error -> do_solve([], [], [collected | acc])
      {val, _} -> do_solve([], [], [[val | collected] | acc])
    end
  end

  defp do_solve([h | t], collected, acc) do
    case Integer.parse(h) do
      :error -> do_solve(t, [], [collected | acc])
      {val, _} -> do_solve(t, [val | collected], acc)
    end
  end
end
