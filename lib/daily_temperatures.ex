defmodule DailyTemperatures do
  @spec solve(temperatures :: [integer]) :: [integer]
  @doc """
      iex> DailyTemperatures.solve([73,74,75,71,69,72,76,73])
      [1,1,4,2,1,1,0,0]

      iex> DailyTemperatures.solve([30,40,50,60])
      [1,1,1,0]

      iex> DailyTemperatures.solve([30,60,90])
      [1,1,0]
  """
  def solve(temperatures) do
    output = (for x <- 0..length(temperatures) - 1, into: %{}, do: {x, 0})
    temperatures
    |> Stream.with_index()
    |> Enum.reduce({output, []}, fn {temperature, index}, {output, stack} ->
      {output, stack} = pop(output, stack, {temperature, index})
      {output, [{temperature, index} | stack]}
    end)
    |> elem(0)
    |> Map.to_list()
    |> Enum.sort_by(fn {pos, _val} -> pos end)
    |> Enum.reduce([], fn {_, val}, acc ->
      [val | acc]
    end)
    |> Enum.reverse
  end

  defp pop(output, [], _), do: {output, []}
  defp pop(output, [{top_t, _top_i} | _tail] = stack, {temperature, index}) when top_t >= temperature, do: {output, [{temperature, index} | stack]}
  defp pop(output, [{_top_t, top_i} | tail], {temperature, index}) do
    a = Map.put(output, top_i, index - top_i)
    pop(a, tail, {temperature, index})
  end
end
