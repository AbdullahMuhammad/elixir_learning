# lets solve the above problem.
# Definition for singly-linked list.
#
defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule ListOperations do
  # Here, you can define the add_lists function and other related functions.

  def add_two_numbers(l1, l2) do
    dummy_head = %ListNode{}
    add_lists(l1, l2, 0, dummy_head)
    reversed_result = add_lists(l1, l2, 0, nil)
    reverse_list(reversed_result)
  end

  defp reverse_list(list), do: do_reverse_list(list, nil)

  defp do_reverse_list(nil, acc), do: acc

  defp do_reverse_list(%ListNode{val: val, next: next}, acc) do
    do_reverse_list(next, %ListNode{val: val, next: acc})
  end

  defp add_lists(nil, nil, 0, result), do: result

  defp add_lists(nil, nil, 1, result) do
    new_node = %ListNode{val: 1, next: result}
    add_lists(nil, nil, 0, new_node)
  end

  defp add_lists(nil, l2, carry, result) do
    # Call the new_val_and_new_carry function
    {new_carry, new_val} = new_val_and_new_carry(0, l2.val, carry)
    new_node = %ListNode{val: new_val, next: result}
    add_lists(nil, l2.next, new_carry, new_node)
  end

  defp add_lists(l1, nil, carry, result) do
    # Call the new_val_and_new_carry function
    {new_carry, new_val} = new_val_and_new_carry(l1.val, 0, carry)
    new_node = %ListNode{val: new_val, next: result}
    add_lists(l1.next, nil, new_carry, new_node)
  end

  defp add_lists(l1, l2, carry, result) do
    # Call the new_val_and_new_carry function
    {new_carry, new_val} = new_val_and_new_carry(l1.val, l2.val, carry)
    new_node = %ListNode{val: new_val, next: result}
    add_lists(l1.next, l2.next, new_carry, new_node)
  end

  defp new_val_and_new_carry(val_1, val_2, carry) do
    sum = val_1 + val_2 + carry
    new_val = rem(sum, 10) # value for the new node
    new_carry = div(sum, 10)
    { new_carry, new_val }
  end

end

# List 1: 1 -> 2 -> 3
list1 = %ListNode{val: 1, next: %ListNode{val: 2, next: %ListNode{val: 3, next: nil}}}

# List 2: 4 -> 5 -> 6
list2 = %ListNode{val: 4, next: %ListNode{val: 5, next: %ListNode{val: 6, next: nil}}}

# List 3: 7 -> 8
list3 = %ListNode{val: 7, next: %ListNode{val: 8, next: nil}}

ListOperations.add_two_numbers(list1, list2)
ListOperations.add_two_numbers(list1, list3)
