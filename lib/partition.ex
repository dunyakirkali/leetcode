defmodule Partition do
  use Agent

  def start do
    Agent.start_link(fn -> MapSet.new end, name: __MODULE__)
  end

  @doc """
      iex> Partition.solve("aab")
      [["a","a","b"],["aa","b"]]

      iex> Partition.solve("a")
      [["a"]]

      iex> Partition.solve("bb")
      [["b", "b"], ["bb"]]

      iex> Partition.solve("cdd")
      [["c","d","d"],["c","dd"]]
  """
  @spec solve(s :: String.t) :: [[String.t]]
  def solve(s) do
    start()

    s
    |> String.graphemes()
    |> part()

    res = Agent.get(__MODULE__, &(&1))
    Agent.update(__MODULE__, fn _ -> MapSet.new end)
    res |> Enum.to_list()
  end

  defp part(lst, acc \\ []) do
    for index <- 1..length(lst) do
      do_partition(lst, index, acc)
    end
  end

  defp do_partition([], _, acc) do
    Agent.update(__MODULE__, fn set ->
      MapSet.put(set, Enum.reverse(acc))
    end)
  end

  defp do_partition(lst, index, acc) do
    {l, r} = Enum.split(lst, index)
    if palindrome?(l) do
      part(r, [Enum.join(l) | List.flatten(acc)])
    else
      []
    end
  end

  defp palindrome?(lst) do
    lst
    |> Enum.reverse()
    |> Kernel.==(lst)
  end
end
