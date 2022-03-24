defmodule NumRescueBoats do
  @doc """
      iex> NumRescueBoats.solve([1,2], 3)
      1

      iex> NumRescueBoats.solve([3,2,2,1], 3)
      3

      iex> NumRescueBoats.solve([3,5,3,4], 5)
      4
  """
  @spec solve(people :: [integer], limit :: integer) :: integer
  def solve(people, limit) do
    people
    |> Enum.sort()
    |> Enum.with_index
    |> Enum.map(fn {v, k} -> {k, v} end)
    |> Map.new
    |> calculate(limit)
  end

  def calculate(people, limit) do
    do_solve(people, limit, 0, Enum.count(people) - 1, 0)
  end

  def do_solve(_people, _limit, left, right, count) when left > right, do: count
  def do_solve(_people, _limit, left, right, count) when left == right, do: count + 1
  def do_solve(people, limit, left, right, count) do
    if people[left] + people[right] <= limit do
      do_solve(people, limit, left + 1, right - 1, count + 1)
    else
      do_solve(people, limit, left, right - 1, count + 1)
    end
  end
end
