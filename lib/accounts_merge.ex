defmodule AccountsMerge do
  @doc """
      iex> AccountsMerge.solve([["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]])
      [["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"], ["John", "john00@mail.com", "john_newyork@mail.com", "johnsmith@mail.com"]]

      iex> AccountsMerge.solve([["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]])
      [["Fern", "Fern0@m.co", "Fern1@m.co", "Fern5@m.co"], ["Ethan", "Ethan0@m.co", "Ethan4@m.co", "Ethan5@m.co"], ["Gabe", "Gabe0@m.co", "Gabe1@m.co", "Gabe3@m.co"], ["Kevin", "Kevin0@m.co", "Kevin3@m.co", "Kevin5@m.co"], ["Hanzo", "Hanzo0@m.co", "Hanzo1@m.co", "Hanzo3@m.co"]]
  """
  @spec solve(accounts :: [[String.t]]) :: [[String.t]]
  def solve(accounts) do
    graph =
      accounts
      |> Enum.reduce(:digraph.new, fn line, acc ->
        [name | emails] = line
        Enum.reduce(emails, acc, fn email, acc ->
          :digraph.add_vertex(acc, email, name)
          acc
        end)

        emails
        |> Enum.chunk_every(2, 1, :discard)
        |> Enum.reduce(acc, fn [from, to], acc ->
          :digraph.add_edge(acc, from, to)
          :digraph.add_edge(acc, to, from)
          acc
        end)
        acc
      end)

    :digraph_utils.components(graph)
    |> Enum.map(fn component ->
      [h | _] = component
      {_, label} = :digraph.vertex(graph, h)
      [label | Enum.sort(component)]
    end)
  end
end
