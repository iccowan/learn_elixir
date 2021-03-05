defmodule Fibonacci do

    def fib(a_n2, a_n1, max_n) do
        if a_n2 + a_n1 >= max_n do
            # nothing
        else
            IO.puts a_n1 + a_n2
            fib(a_n1, a_n2 + a_n1, max_n)
        end
    end

    def fib(n) do
        # Print the Fibonacci sequence from 0...n
        IO.puts 0
        IO.puts 1
        fib(0, 1, n)

        # exit with a 0
        0
    end
end
