defmodule SearchMatrix do
  @doc """
      iex> SearchMatrix.solve([[1]], 1)
      true

      iex> SearchMatrix.solve([[1,3]], 1)
      true

      iex> SearchMatrix.solve([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)
      true

      iex> SearchMatrix.solve([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
      false
  """
  @spec solve(matrix :: [[integer]], target :: integer) :: boolean
  def solve(matrix, target) do
    list = List.flatten(matrix)
    bin_search(list, target, 0, length(list) - 1)
  end

  # def bin_search([key], key, _, _), do: true
  def bin_search(list, key, low, high) do
    if high < low do
      false
    else
      mid = div(low + high, 2)
      item = Enum.at(list, mid)
      cond do
        key < item -> bin_search(list, key, low, mid - 1)
        key > item -> bin_search(list, key, mid + 1, high)
        true       -> true
      end
    end
  end
end
