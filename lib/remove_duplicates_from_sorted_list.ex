defmodule RemoveDuplicatesFromSortedList do
  @doc """
      iex> RemoveDuplicatesFromSortedList.init([1,2,3])
      %ListNode{val: 1, next: %ListNode{val: 2, next: %ListNode{val: 3, next: nil}}}
  """
  def init(items) do
    items
    |> do_init(%ListNode{})
  end

  defp do_init([last], acc) do
    %ListNode{acc | val: last}
  end
  defp do_init([h | t], acc) do

    %ListNode{acc | val: h, next: do_init(t, %ListNode{})}
  end

  @doc """
      iex> RemoveDuplicatesFromSortedList.delete([1,1,2])
      %ListNode{val: 1, next: %ListNode{val: 2, next: nil}}

      iex> RemoveDuplicatesFromSortedList.delete([1,1,2,3,3])
      %ListNode{val: 1, next: %ListNode{val: 2, next: %ListNode{val: 3, next: nil}}}
  """
  def delete(items) do
    items
    |> init()
    |> delete_duplicates()
  end

  @spec delete_duplicates(head :: ListNode.t | nil) :: ListNode.t | nil
  def delete_duplicates(nil), do: nil
  def delete_duplicates(%ListNode{val: _, next: nil} = head), do: head
  def delete_duplicates(%ListNode{val: val_h, next: %ListNode{val: val_n, next: _} = next}) when val_h == val_n do
    delete_duplicates(next)
  end
  def delete_duplicates(head) do
    %ListNode{head | next: delete_duplicates(head.next)}
  end
end
