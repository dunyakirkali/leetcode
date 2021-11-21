defmodule BuildTree do
  @doc """
      iex> BuildTree.solve([9,3,15,20,7], [9,15,7,20,3])
      %TreeNode{left: %TreeNode{left: nil, right: nil, val: 9}, right: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 15}, right: %TreeNode{left: nil, right: nil, val: 7}, val: 20}, val: 3}

      # iex> BuildTree.solve([-1], [-1])
      # %TreeNode{left: nil, right: nil, val: -1}
  """
  @spec solve(inorder :: [integer], postorder :: [integer]) :: TreeNode.t | nil
  def solve(inorder, postorder) do
    do_solve(inorder, postorder, %TreeNode{})
  end

  defp do_solve([], [], _), do: nil
  defp do_solve(inorder, postorder, acc) do
    root = List.last(postorder)
    {left_inorder, right_inorder} = split(inorder, root, [])

    right_postorder = (postorder -- left_inorder) -- [root]
    left_postorder = (postorder -- right_inorder) -- [root]

    %TreeNode{acc | val: root, left: do_solve(left_inorder, left_postorder, acc), right: do_solve(right_inorder, right_postorder, acc)}
  end

  defp split([h | t], char, left) when char == h, do: {Enum.reverse(left), t}
  defp split([h | t], char, left) do
    split(t, char, [h | left])
  end
end
