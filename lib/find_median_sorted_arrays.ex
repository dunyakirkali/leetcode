defmodule FindMedianSortedArrays do
  @spec solve(nums1 :: [integer], nums2 :: [integer]) :: float
  # @doc """
  #     iex> FindMedianSortedArrays.solve([1,3], [2])
  #     2.0

  #     iex> FindMedianSortedArrays.solve([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [11, 12, 13, 14, 15, 16, 17, 18, 19])
  #     10.0
  # """
  def solve(nums1, nums2) do
    do_solve(nums1, nums2)
  end

  defp do_solve([], nums2), do: median(nums2)
  defp do_solve(nums1, []), do: median(nums1)
  defp do_solve([num1], [num2]), do: median([num1, num2])

  defp do_solve(nums1, nums2) do
    med1 = median(nums1)
    med2 = median(nums2)

    if med2 > med1 do
      {f1, _} = split(nums1, trunc(med1), [])
      {_, s2} = split(nums2, trunc(med2), [])
      do_solve(f1, s2)
    else
      {_, s1} = split(nums1, trunc(med1), [])
      {f2, _} = split(nums2, trunc(med2), [])
      do_solve(f2, s1)
    end
  end

  @doc """
      iex> FindMedianSortedArrays.median([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      5.5

      iex> FindMedianSortedArrays.median([11, 12, 13, 14, 15, 16, 17, 18, 19])
      15
  """
  def median(list) when rem(length(list), 2) == 0 do
    hi_mid = div(length(list), 2)
    lo_mid = hi_mid - 1
    (Enum.at(list, lo_mid) + Enum.at(list, hi_mid)) / 2
  end

  def median(list) when rem(length(list), 2) == 1 do
    mid = div(length(list), 2)
    Enum.at(list, mid)
  end

  defp split([], nil, _left), do: {nil, nil}
  defp split([h | t], char, left) when char == h, do: {Enum.reverse(left), t}

  defp split([h | t], char, left) do
    split(t, char, [h | left])
  end
end
