defmodule AllPathsSourceTarget do
  use Agent

  def start do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end
  @doc """
      iex> AllPathsSourceTarget.solve([[1,2],[3],[3],[]])
      [[0,1,3],[0,2,3]]

      iex> AllPathsSourceTarget.solve([[4,3,1],[3,2,4],[3],[4],[]])
      [[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
  """
  @spec solve(graph :: [[integer]]) :: [[integer]]
  def solve(graph) do
    start()
    dig =
      0..(length(graph) - 1)
      |> Enum.reduce(:digraph.new, fn x, acc ->
        :digraph.add_vertex(acc, x)
        acc
      end)

    dig =
      graph
      |> Enum.with_index()
      |> Enum.reduce(dig, fn {conns, ind}, acc ->
        Enum.reduce(conns, acc, fn x, acc ->
          :digraph.add_edge(acc, ind, x)
          acc
        end)
        acc
      end)

    do_solve(dig, 0, [])

    res = Agent.get(__MODULE__, &(&1))
    Agent.update(__MODULE__, fn _ ->
      []
    end)
    res
  end

  defp do_solve(graph, node, acc) do
    if node == length(:digraph.vertices(graph)) - 1 do
      Agent.update(__MODULE__, &([[node | acc] |> Enum.reverse | &1]))
    else
      :digraph.out_neighbours(graph, node)
      |> Enum.map(fn n ->
        do_solve(graph, n, [node | acc])
      end)
    end
  end
end
