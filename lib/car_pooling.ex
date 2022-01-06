defmodule CarPooling do
  @doc """
      # iex> CarPooling.solve([[2,1,5],[3,3,7]], 4)
      # false

      # iex> CarPooling.solve([[2,1,5],[3,3,7]], 5)
      # true

      # iex> CarPooling.solve([[2,1,5],[3,5,7]], 3)
      # true

      # iex> CarPooling.solve([[8,2,3],[4,1,3],[1,3,6],[8,4,6],[4,4,8]], 12)
      # false

      iex> CarPooling.solve([[9,0,1],[3,3,7]], 4)
      false
  """
  @spec solve(trips :: [[integer]], capacity :: integer) :: boolean
  def solve(trips, capacity) do
    ride({trips, capacity, [], 0})
  end

  defp ride({[], _, _, _}), do: true
  defp ride(input) do
    input
    |> unload()
    |> load()
    |> case do
      false -> false
      {trips, capacity, passengers, time} ->
        ride({trips, capacity, passengers, time + 1})
    end
  end

  defp load({trips, capacity, passengers, time}) do
    Enum.reduce_while(trips, {[], capacity, passengers, time}, fn [numPassengersi, fromi, _] = trip, {tps, cap, pss, tim} ->
      if fromi == time do
        curr = pss |> Enum.map(fn [num, _, _] -> num end) |> Enum.sum
        if curr + numPassengersi > capacity do
          {:halt, false}
        else
          {:cont, {tps, cap, [trip | pss], tim}}
        end
      else
        {:cont, {[trip  | tps], cap, pss, tim}}
      end
    end)
  end

  defp unload({trips, capacity, passengers, time}) do
    Enum.reduce(passengers, {trips, capacity, [], time}, fn passenger, {tps, cap, pss, tim} ->
      [_, _, toi] = passenger
      if toi == time do
        {tps, cap, pss, tim}
      else
        {tps, cap, [passenger | pss], tim}
      end
    end)
  end
end
