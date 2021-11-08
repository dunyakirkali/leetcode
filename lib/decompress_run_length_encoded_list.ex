defmodule DecompressRunLengthEncodedList do
  @doc """
      iex> DecompressRunLengthEncodedList.solve([1,2,3,4])
      [2,4,4,4]

      iex> DecompressRunLengthEncodedList.solve([1,1,2,3])
      [1,3,3]
  """
  @spec solve(nums :: [integer]) :: [integer]
  def solve(nums) do
    nums
    |> Enum.chunk_every(2, 2)
    |> Enum.reduce([], fn [count, char], acc ->
      list = for _ <- 1..count, do: char
      [list | acc]
    end)
    |> Enum.reverse()
    |> List.flatten()
  end
end
