defmodule MyAtoi do
  @doc """
      iex> MyAtoi.solve("42")
      42

      iex> MyAtoi.solve("   -42")
      -42

      iex> MyAtoi.solve("4193 with words")
      4193

      iex> MyAtoi.solve("words and 987")
      0

      iex> MyAtoi.solve("+-12")
      0

      iex> MyAtoi.solve("   +0 123")
      0

      iex> MyAtoi.solve("3.14159")
      3

      iex> MyAtoi.solve("")
      0

      iex> MyAtoi.solve("-")
      0

      iex> MyAtoi.solve("  -0012a42")
      -12

      iex> MyAtoi.solve("-+12")
      0

      iex> MyAtoi.solve("-abc")
      0

      iex> MyAtoi.solve("-5-")
      -5

      iex> MyAtoi.solve("-13+8")
      -13
  """
  @spec solve(s :: String.t) :: integer
  def solve(s) do
    state = :trimming
    s
    |> String.to_charlist()
    |> do_parse(state, [])
    |> to_string()
    |> String.to_integer()
    |> cap
  end

  def cap(number) do
    lo = Integer.pow(2, 31) * -1
    hi = Integer.pow(2, 31) - 1
    cond do
      number < lo -> lo
      number > hi -> hi
      true -> number
    end
  end

  def do_parse([], _, []), do: '0'
  def do_parse([], _, '-'), do: '0'
  def do_parse('-', _, []), do: '0'
  def do_parse([], _, acc), do: Enum.reverse(acc)
  def do_parse([h | t], :trimming, acc) do
    case h do
      ?\s -> do_parse(t, :trimming, acc)
      x when x in ?0..?9 -> do_parse(t, :number, [x | acc])
      _ -> do_parse([h | t], :sign, acc)
    end
  end
  def do_parse([h | t], :sign, acc) do
    case h do
      ?- -> do_parse(t, :number, [h | acc])
      ?+ -> do_parse(t, :number, acc)
      _ -> 0
    end
  end
  def do_parse([h | t], :number, acc) do
    case h do
      x when x in ?0..?9 -> do_parse(t, :number, [x | acc])
      ?\s -> do_parse([], :number, acc)
      _ -> do_parse([], :number, acc)
    end
  end
end
