defmodule PreorderTraversal do
  @doc """
      iex> PreorderTraversal.solve(%TreeNode{left: nil, right: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 3}, right: nil, val: 2}, val: 1})
      [1,2,3]

      iex> PreorderTraversal.solve(%TreeNode{val: 1})
      [1]
  """
  @spec solve(root :: TreeNode.t | nil) :: [integer]
  def solve(root) do
    do_solve(root)
  end

  defp do_solve(nil), do: []
  defp do_solve(root) do
    [root.val] ++ do_solve(root.left) ++ do_solve(root.right)
  end
end
