defmodule TwoCitySchedCost do
  @doc """
      iex> TwoCitySchedCost.solve([[10,20],[30,200],[400,50],[30,20]])
      110

      iex> TwoCitySchedCost.solve([[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]])
      1859

      iex> TwoCitySchedCost.solve([[515,563],[451,713],[537,709],[343,819],[855,779],[457,60],[650,359],[631,42]])
      3086
  """
  @spec solve(costs :: [[integer]]) :: integer
  def solve(costs) do
    len = round(length(costs)/2)

    {to_a, _to_b} =
      costs
      |> Enum.map(fn [a_cost, b_cost] ->
        a_cost - b_cost
      end)
      |> Enum.with_index()
      |> Enum.sort_by(fn {diff, _pass} ->
        diff
      end)
      |> Enum.map(fn {_diff, pass} ->
        pass
      end)
      |> Enum.split(len)

    costs
    |> Enum.with_index()
    |> Enum.map(fn {[a_cost, b_cost], pass} ->
      if Enum.member?(to_a, pass) do
        a_cost
      else
        b_cost
      end
    end)
    |> Enum.sum
  end
end
