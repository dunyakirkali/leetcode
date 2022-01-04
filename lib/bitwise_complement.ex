defmodule BitwiseComplement do
  @doc """
      iex> BitwiseComplement.solve(5)
      2

      iex> BitwiseComplement.solve(7)
      0

      iex> BitwiseComplement.solve(10)
      5
  """
  @spec solve(n :: integer) :: integer
  def solve(n) do
    n
    |> Integer.to_string(2)
    |> String.length()
    |> then(fn ndc ->
      "1"
      |> List.duplicate(ndc)
      |> Enum.join()
      |> String.to_integer(2)
    end)
    |> Bitwise.bxor(n)
  end
end
