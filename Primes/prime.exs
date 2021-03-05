defmodule Prime do

    # Check to see if a number is primes
    def is_prime(n, div) do
        cond do
            div == 1 ->
                true
            rem(n, div) == 0 ->
                false
            true ->
                is_prime(n, div - 1)
        end
    end

    def is_prime(n) do
        is_prime(n, n-1)
    end

    # Print the primes
    def print_primes(n) do
        if is_prime(n) do
            IO.puts n
        end

        if n < 1000 do
            print_primes(n + 1)
        end

        if n >= 1000 do
            IO.puts "That's all of the primes under 1000!"
        end
    end

    # Print the print_primes
    def print_primes do
        print_primes(2)
    end

end
