defmodule MyApp.Calc do

    def plus(a, b) do
        a + b
    end

    def mult(a, b) do
        a * b
    end

end

defmodule ListUtils do
    def max([ value | [ head | tail ] ]) when  value < head do
      max([head | tail])
    end

    def max([ value | [head | tail] ]) when  value >= head do
        max([value | tail])
    end

    def max([ value ]), do: value


    def mult([]), do: 1
    def mult(arr) do
        [head | tail] = arr
        head * mult(tail)
    end

    def map([], _fun), do: []
    def map([head | tail], fun) do
        [ fun.(head) | map(tail, fun) ]
    end
end

# ListUtils.mult([1,2,3]) |>
# IO.puts

# ListUtils.map([1,2,3], &(&1 * 3)) |>
# IO.inspect

ListUtils.max([3,5,8,1,0]) |>
IO.inspect
