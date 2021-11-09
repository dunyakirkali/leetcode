defmodule PerfectNumber do
  @doc """
      iex> PerfectNumber.solve(28)
      true

      iex> PerfectNumber.solve(6)
      true

      iex> PerfectNumber.solve(496)
      true

      iex> PerfectNumber.solve(8128)
      true

      iex> PerfectNumber.solve(2)
      false

      iex> PerfectNumber.solve(32582657)
      false

      iex> PerfectNumber.solve(99999991)
      false
  """
  @spec solve(num :: integer) :: boolean
  def solve(num) do
    1..ceil(:math.sqrt(num))
    |> Stream.map(fn x ->
      if rem(num, x) == 0 do
        [x, div(num, x)]
      else
        0
      end
    end)
    |> Enum.to_list
    |> List.flatten
    |> Enum.filter(fn x ->
      x != num
    end)
    |> Enum.uniq()
    |> Enum.sum()
    |> Kernel.==(num)
  end
end
