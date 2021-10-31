defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule AddTwoNumbers do
  @doc """
      # iex> AddTwoNumbers.solve(%ListNode{val: 2, next: %ListNode{val: 4, next: %ListNode{val: 3, next: nil}}}, %ListNode{val: 5, next: %ListNode{val: 6, next: %ListNode{val: 4, next: nil}}})
      # %ListNode{val: 7, next: %ListNode{val: 0, next: %ListNode{val: 8, next: nil}}}

      iex> AddTwoNumbers.solve(%ListNode{val: 2, next: nil}, %ListNode{val: 5, next: %ListNode{val: 6, next: %ListNode{val: 4, next: nil}}})
      %ListNode{val: 7, next: %ListNode{val: 6, next: %ListNode{val: 4, next: nil}}}
  """
  @spec solve(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  def solve(l1, l2) do
    do_solve(l1, l2, 0)
  end

  defp do_solve(l1, l2, cary) do
    sum = l1.val + l2.val + cary
    new_cary = div(sum, 10)
    new_rem = rem(sum, 10)
    case {l1.next, l2.next} do
      {nil, nil} ->
        if new_cary == 0 do
          %ListNode{val: new_rem, next: nil}
        else
          %ListNode{val: new_rem, next: %ListNode{val: new_cary, next: nil}}
        end
      {nil, b} ->
        %ListNode{val: new_rem, next: do_solve(%ListNode{val: 0, next: nil}, b, new_cary)}
      {a, nil} ->
        %ListNode{val: new_rem, next: do_solve(a, %ListNode{val: 0, next: nil}, new_cary)}
      {a, b} ->
        %ListNode{val: new_rem, next: do_solve(a, b, new_cary)}
    end
  end
end
