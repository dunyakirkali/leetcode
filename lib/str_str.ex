defmodule StrStr do
  @doc """
      iex> StrStr.solve( "hello", "ll")
      2

      iex> StrStr.solve("aaaaa", "bba")
      -1

      iex> StrStr.solve("", "")
      0
  """
  def solve(haystack, needle) do
    do_solve(haystack, needle, 0)
  end

  defp do_solve(<<match::binary>>, <<match::binary>>, ind), do: ind
  defp do_solve(<<haystack::binary>>, <<needle::binary>>, ind) do
    len = byte_size(needle)
    hlen = byte_size(haystack)

    if hlen < len do
      -1
    else
      <<head::binary-size(len), _::binary>> = haystack
      if head == needle do
        ind
      else
        <<_::size(8), rest::binary>> = haystack
        do_solve(rest, needle, ind + 1)
      end
    end
  end
  defp do_solve(_, _, _), do: -1
end
