defmodule CalPoints do
  @doc """
      iex> CalPoints.solve(["5","2","C","D","+"])
      30

      iex> CalPoints.solve(["5","-2","4","C","D","9","+","+"])
      27

      iex> CalPoints.solve(["1"])
      1
  """
  @spec solve(ops :: [String.t]) :: integer
  def solve(ops) do
    ops
    |> do_solve([])
    |> Enum.sum()
  end

  def do_solve([], record), do: record
  def do_solve([h | t], record) do
    case h do
      "+" ->
        sum = Enum.take(record, 2) |> Enum.sum
        do_solve(t, [sum | record])
      "D" ->
        double = List.first(record) |> Kernel.*(2)
        do_solve(t, [double | record])
      "C" ->
        [_ | rest] = record
        do_solve(t, rest)
      _ ->
        val = String.to_integer(h)
        do_solve(t, [val | record])
    end
  end
end
