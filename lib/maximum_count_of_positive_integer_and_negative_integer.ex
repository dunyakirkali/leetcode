defmodule MaximumCountOfPositiveIntegerAndNegativeInteger do
  @spec solve(nums :: [integer]) :: integer
  def maximum_count(nums) do
    nums
    |> Enum.reduce([0, 0], fn item, [less, more] ->
      cond do
        item < 0 -> [less + 1, more]
        item > 0 -> [less, more + 1]
        true -> [less, more]
      end
    end)
    |> Enum.max
  end
end
