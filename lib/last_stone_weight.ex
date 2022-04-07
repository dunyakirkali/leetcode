defmodule PQ do
  def new() do
    []
  end

  def push(queue, item) do
    pos = find_pos(queue, item, 0)
    List.insert_at(queue, pos, item)
  end

  def pop([]), do: nil
  def pop([head | tail]), do: {head, tail}

  defp find_pos([], _, index), do: index
  defp find_pos([head | tail], item, index) do
    if item >= head do
      index
    else
      find_pos(tail, item, index + 1)
    end
  end
end

defmodule LastStoneWeight do
  @doc """
      iex> LastStoneWeight.solve([2,7,4,1,8,1])
      1

      iex> LastStoneWeight.solve([1])
      1
  """
  @spec solve(stones :: [integer]) :: integer
  def solve(stones) do
    queue =
      Enum.reduce(stones, PQ.new, fn stone, queue ->
        PQ.push(queue, stone)
      end)

    do_solve(queue)
  end

  def do_solve([]), do: 0
  def do_solve([item]), do: item
  def do_solve([m1, m2 | tail]) when m1 == m2 do
    do_solve(tail)
  end
  def do_solve([m1, m2 | tail]) do
    tail
    |> PQ.push(abs(m1 - m2))
    |> do_solve()
  end
end
