defmodule ProductExceptSelf do
  @doc """
      iex> ProductExceptSelf.solve([1,2,3,4])
      [24,12,8,6]

      iex> ProductExceptSelf.solve([-1,1,0,-3,3])
      [0,0,9,0,0]

      iex> ProductExceptSelf.solve([-1,1,0,-3,0])
      [0,0,0,0,0]
  """
  @spec solve(nums :: [integer]) :: [integer]
  def solve(nums) do
    zeros =
      nums
      |> Enum.filter(fn x-> x == 0 end)
      |> Enum.count

    case zeros do
      0 ->
        product =
          nums
          |> Enum.reduce(1, fn x, acc ->
            acc * x
          end)

        nums
        |> Enum.map(fn x ->
          div(product, x)
        end)
      1 ->
        product =
          nums
          |> Enum.filter(fn x -> x != 0 end)
          |> Enum.reduce(1, fn x, acc ->
            acc * x
          end)

        nums
        |> Enum.map(fn x ->
          if x == 0 do
            product
          else
            0
          end
        end)
      _ ->
        for _ <- nums, do: 0
    end
  end
end
