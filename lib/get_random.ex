defmodule GetRandom do
  use Agent

  @spec init_(head :: ListNode.t | nil) :: any
  def init_(head) do
    case Agent.start_link(fn -> head end, name: __MODULE__) do
      {:ok, pid} -> {:ok, pid}
      {:error, {:already_started, pid}} -> Agent.update(__MODULE__, fn _ -> head end)
      response -> response
    end
  end

  @spec solve() :: integer
  def solve() do
    Agent.get(__MODULE__, &(&1))
    |> then(fn list ->
      cnt = do_count(list, 0)
      vals = do_vals(list, cnt, [])

      Enum.random(vals)
    end)
  end

  defp do_vals(_, 1, acc), do: acc
  defp do_vals(list_node, n, acc), do: do_vals(list_node.next, n - 1, [list_node.val | acc])

  defp do_count(nil, acc), do: acc
  defp do_count(list_node, acc) do
    do_count(list_node.next, acc + 1)
  end
end
