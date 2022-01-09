defmodule IsRobotBounded do
  @doc """
      iex> IsRobotBounded.solve("GGLLGG")
      true

      iex> IsRobotBounded.solve("GG")
      false

      iex> IsRobotBounded.solve("GL")
      true
  """
  @spec solve(instructions :: String.t) :: boolean
  def solve(instructions) do
    start_pos = {0, 0}

    {end_pos, end_head} =
      instructions
      |> String.graphemes()
      |> Enum.reduce({start_pos, :n}, fn command, {{x, y}, head} ->
        case command do
          "G" -> move({{x, y}, head})
          _   -> {{x, y}, turn(head, command)}
        end
      end)

    cond do
      start_pos == end_pos -> true
      end_head == :n -> false
      true -> true
    end
  end

  def move({{x, y}, head}) do
    case head do
      :n -> {{x, y - 1}, head}
      :e -> {{x + 1, y}, head}
      :s -> {{x, y + 1}, head}
      :w -> {{x - 1, y}, head}
    end
  end

  def turn(head, "L") do
    case head do
      :n -> :w
      :e -> :n
      :s -> :e
      :w -> :s
    end
  end

  def turn(head, "R") do
    case head do
      :n -> :e
      :e -> :s
      :s -> :w
      :w -> :n
    end
  end
end
