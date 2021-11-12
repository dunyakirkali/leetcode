defmodule AddBinary do
  @spec solve(a :: String.t, b :: String.t) :: String.t
  @doc """
      iex> AddBinary.solve("11", "1")
      "100"

      iex> AddBinary.solve("1010", "1011")
      "10101"
  """
  def solve(a, b) do
    {a, _} = Integer.parse(a, 2)
    {b, _} =  Integer.parse(b, 2)

    a
    |> Kernel.+(b)
    |> Integer.to_string(2)
  end
end
