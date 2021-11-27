defmodule PostorderTraversal do
  @doc """
      iex> PostorderTraversal.solve(%TreeNode{left: nil, right: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 3}, right: nil, val: 2}, val: 1})
      [3, 2, 1]

      iex> PostorderTraversal.solve(%TreeNode{val: 1})
      [1]
  """
  @spec solve(root :: TreeNode.t | nil) :: [integer]
  def solve(root) do
    do_solve(root)
  end

  defp do_solve(nil), do: []
  defp do_solve(root) do
    do_solve(root.left) ++ do_solve(root.right) ++ [root.val]
  end
end
