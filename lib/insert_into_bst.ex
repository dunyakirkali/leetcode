defmodule InsertIntoBst do
  @doc """
      iex> BuildTree.solve([1,2,3,4,7], [1,3,2,7,4])
      ...> |> InsertIntoBst.solve(5)
      %TreeNode{left: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 1}, right: %TreeNode{left: nil, right: nil, val: 3}, val: 2}, right: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 5}, right: nil, val: 7}, val: 4}
  """
  @spec solve(root :: TreeNode.t | nil, val :: integer) :: TreeNode.t | nil
  def solve(root, val) do
    cond do
      root == nil -> %TreeNode{val: val}
      root.val < val -> %TreeNode{root | right: solve(root.right, val)}
      true -> %TreeNode{root | left: solve(root.left, val)}
    end
  end
end
