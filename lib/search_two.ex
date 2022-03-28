defmodule SearchTwo do
  @doc """
      iex> SearchTwo.solve([2,5,6,0,0,1,2], 0)
      true

      iex> SearchTwo.solve([2,5,6,0,0,1,2], 3)
      false
  """
  @spec solve(nums :: [integer], target :: integer) :: boolean
  def solve(nums, target) do
    do_solve(nums, target)
  end

  def do_solve([], _), do: false
  def do_solve([target | _], target), do: true
  def do_solve([h | t], target) do
    if h > target do
      t
      |> Enum.reverse
      |> do_solve(target)
    else
      t
      |> do_solve(target)
    end
  end
end
