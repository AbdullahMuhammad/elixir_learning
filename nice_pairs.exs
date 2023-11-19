# You are given an array nums that consists of non-negative integers. Let us define rev(x) as the reverse of the non-negative integer x. For example, rev(123) = 321, and rev(120) = 21. A pair of indices (i, j) is nice if it satisfies all of the following conditions:

# 0 <= i < j < nums.length
# nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])
# Return the number of nice pairs of indices. Since that number can be too large, return it modulo 109 + 7.



# Example 1:

# Input: nums = [42,11,1,97]
# Output: 2
# Explanation: The two pairs are:
#  - (0,3) : 42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121.
#  - (1,2) : 11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12.
# Example 2:

# Input: nums = [13,10,35,24,76]
# Output: 4


# Constraints:

# 1 <= nums.length <= 10^5
# 0 <= nums[i] <= 10^9

# Link to the problem
# https://leetcode.com/problems/count-nice-pairs-in-an-array/description/

defmodule NicePairs do
  def count_nice_pairs(nums) do
   diff_list  = do_count_nice_pairs(nums, [])
   pairs_map = create_pair_map(diff_list, %{})
   num_of_nice_pairs = Enum.reduce(pairs_map, 0, fn {_key, value}, acc ->
    acc + div(value * (value - 1), 2) |> rem(1_000_000_000)
   end)
   trunc(num_of_nice_pairs |> rem(1_000_000_000))
  end

  defp create_pair_map([], p_map), do: p_map

  defp create_pair_map(diff_list, p_map) do
    [head | tail] = diff_list
    new_map = add_key(p_map, head) #this seems too expensive. Ask Guy Sensei
    create_pair_map(tail, new_map)
  end

  defp add_key(map, key) do
    case Map.get(map, key) do
      nil ->
        # Key doesn't exist, set it to 1
        Map.put(map, key, 1)
      count ->
        # Key exists, increment its value
        Map.put(map, key, count + 1)
    end
  end

  defp do_count_nice_pairs([], diff_list), do: diff_list

  defp do_count_nice_pairs(nums, diff_list) do
    [head | tail] = nums
    difference = head - rev(head)
    do_count_nice_pairs(tail, [difference | diff_list])
  end

  defp rev(num) do
    str = Integer.to_string(num)
    r_str = String.reverse(str)
    String.to_integer(r_str)
  end

end
