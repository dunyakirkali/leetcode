defmodule LongestCommonPrefix do
  @spec solve(strs :: [String.t]) :: String.t
  @doc """
      iex> LongestCommonPrefix.solve([""])
      ""

      iex> LongestCommonPrefix.solve(["",""])
      ""

      iex> LongestCommonPrefix.solve(["ab", "a"])
      "a"

      iex> LongestCommonPrefix.solve(["flower","flow","flight"])
      "fl"

      iex> LongestCommonPrefix.solve(["dog","racecar","car"])
      ""
  """
  def solve(strs) do
    strs
    |> Enum.map(&String.graphemes/1)
    |> sanitize()
    |> do_solve([])
    |> Enum.reverse()
    |> Enum.join()
  end

  defp sanitize(strs) do
    min =
      strs
      |> Enum.map(&(length(&1)))
      |> Enum.min

    strs
    |> Enum.map(&(Enum.slice(&1, 0, min)))
  end

  defp do_solve([""], acc), do: acc
  defp do_solve([str], _), do: str
  defp do_solve(strs, acc) do
    same =
      strs
      |> Enum.map(&(Enum.at(&1, 0)))
      |> Enum.filter(&(&1 != nil))
      |> MapSet.new()
      |> MapSet.size()
      |> Kernel.==(1)

    if same do
      do_solve(strs |> Enum.map(&(List.delete_at(&1, 0))), [strs |> Enum.at(0) |> Enum.at(0) | acc])
    else
      acc
    end
  end
end
