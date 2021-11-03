defmodule ValidParentheses do
  @doc """
      iex> ValidParentheses.solve("()")
      true

      iex> ValidParentheses.solve("()[]{}")
      true

      iex> ValidParentheses.solve("(]")
      false

      iex> ValidParentheses.solve("([)]")
      false

      iex> ValidParentheses.solve("{[]}")
      true
  """
  @spec solve(s :: String.t) :: boolean
  def solve(s) do
    s
    |> String.to_charlist()
    |> do_solve([])
  end

  defp do_solve([], []), do: true
  defp do_solve([], _acc), do: false
  defp do_solve([h | t], []), do: do_solve(t, [h])
  defp do_solve([h | t], [ah | at]) when h == ?( or h == ?{ or h == ?[, do: do_solve(t, [h | [ah | at]])
  defp do_solve([h | t], [ah | at]) when h == ?) and ah == ?(, do: do_solve(t, at)
  defp do_solve([h | t], [ah | at]) when h == ?] and ah == ?[, do: do_solve(t, at)
  defp do_solve([h | t], [ah | at]) when h == ?} and ah == ?{, do: do_solve(t, at)
  defp do_solve(_, _), do: false
end
