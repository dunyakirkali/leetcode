defmodule SumRootToLeaf do
  use Agent

  @doc """
      iex> %TreeNode{left: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 0}, right: %TreeNode{left: nil, right: nil, val: 1}, val: 0}, right: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 0}, right: %TreeNode{left: nil, right: nil, val: 1}, val: 1}, val: 1}
      ...> |> SumRootToLeaf.solve()
      22

      iex> %TreeNode{left: nil, right: nil, val: 0}
      ...> |> SumRootToLeaf.solve()
      0
  """
  @spec solve(root :: TreeNode.t() | nil) :: integer
  def solve(root) do
    Agent.start_link(fn -> [] end, name: __MODULE__)

    path_to_leaves(root)

    res = Agent.get(__MODULE__, & &1)

    Agent.update(__MODULE__, fn _ ->
      []
    end)

    res
    |> Enum.map(&Integer.undigits(&1, 2))
    |> Enum.sum()
  end

  def path_to_leaves(root) do
    do_path_to_leaves(root, [])
  end

  def do_path_to_leaves(root, acc) do
    cond do
      root == nil ->
        Agent.update(__MODULE__, &[[] |> Enum.reverse() | &1])

      root.left == nil and root.right == nil ->
        Agent.update(__MODULE__, &[[root.val | acc] |> Enum.reverse() | &1])

      true ->
        do_path_to_leaves(root.left, [root.val | acc])
        do_path_to_leaves(root.right, [root.val | acc])
    end
  end
end
