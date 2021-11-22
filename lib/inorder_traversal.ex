defmodule InorderTraversal do
  @doc """
      iex> InorderTraversal.solve(%TreeNode{left: %TreeNode{left: nil, right: nil, val: 9}, right: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 15}, right: %TreeNode{left: nil, right: nil, val: 7}, val: 20}, val: 3})
      [9, 3, 15, 20, 7]

      iex> InorderTraversal.solve(%TreeNode{val: 1})
      [1]
  """
  @spec solve(root :: TreeNode.t | nil) :: [integer]
  def solve(root) do
    do_solve(root, [])
  end

  defp do_solve(nil, acc), do: acc
  defp do_solve(root, acc) do
    acc = do_solve(root.right, acc)
    do_solve(root.left, [root.val | acc])
  end
end
