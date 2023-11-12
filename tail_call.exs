defmodule ListUtils do
  def mult(list), do: do_mult(1, list)

  defp do_mult(current_val, []), do: current_val
  defp do_mult(current_val, [head | tail]) do
    do_mult(current_val * head, tail)
  end

  def max(list) do
    [current_max | [head | tail]] = list
    do_max(current_max, [head | tail])
  end

  defp do_max(current_max, []), do: current_max
  defp do_max(current_max, [head | tail]) do
    if current_max > head do
      do_max(current_max, tail)
    else
      do_max(head, tail)
    end
  end


  def alt_mult(list), do: do_alt_mult([ 1 | list ])
  defp do_alt_mult([current_val | []]), do: current_val
  defp do_alt_mult([current_val, head | tail]) do
    new_current_val = current_val * head
    do_alt_mult([new_current_val | tail])
  end



end

# ListUtils.mult([1,2,3]) |>
# IO.puts

# ListUtils.max([1,2,13,0,10,2]) |>
# IO.puts

ListUtils.alt_mult([1,2,3,4]) |>
IO.puts
