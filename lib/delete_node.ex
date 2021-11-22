defmodule DeleteNode do
  @doc """
      iex> DeleteNode.solve(%TreeNode{left: %TreeNode{left: nil, right: nil, val: 9}, right: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 15}, right: %TreeNode{left: nil, right: nil, val: 7}, val: 20}, val: 3}, 7)
      %TreeNode{left: %TreeNode{left: %TreeNode{left: nil, right: nil, val: 9}, right: nil, val: 3}, right: %TreeNode{left: nil, right: nil, val: 20}, val: 15}

      iex> DeleteNode.solve(%TreeNode{val: 12}, 0)
      %TreeNode{val: 12}

      iex> DeleteNode.solve(%TreeNode{}, 0)
      nil
  """
  @spec solve(root :: TreeNode.t | nil, key :: integer) :: TreeNode.t | nil
  def solve(root, key) do
    root
    |> inorder()
    |> List.delete(key)
    |> parse()
  end

  defp inorder(root) when root == nil, do: []
  defp inorder(root) do
    inorder(root.left) ++ [root.val] ++ inorder(root.right)
  end

  defp parse(nil), do: nil
  defp parse([]), do: nil
  defp parse([h]), do: %TreeNode{val: h}
  defp parse(list) do
    center = div(length(list), 2)
    mid = Enum.at(list, center)
    {left, right} = split(list, mid, [])

    %TreeNode{val: mid, left: parse(left), right: parse(right)}
  end

  defp split([], nil, _left), do: {nil, nil}
  defp split([h | t], char, left) when char == h, do: {Enum.reverse(left), t}
  defp split([h | t], char, left) do
    split(t, char, [h | left])
  end
end
