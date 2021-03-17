defmodule Procs do

  def greeter(count, what_to_say) do
    receive do
      { :exit, reason } ->
        exit(reason)
      { :reset } ->
        greeter(0, what_to_say)
      { :add, n } ->
        greeter(count + n, what_to_say)
      msg ->
        IO.puts "#{ count }: #{ what_to_say } #{ msg }"
        greeter(count, what_to_say)
    end
  end

  def fib(n, cache) when Map.has_key?(cache, n) do
    Map.get(cache, n)
  end

  def fib(n, cache) do
    val = fib(n - 1, cache) + fib(n - 2, cache)
    %{ cache | n => val}
  end

  def fib(n) do
    fib(n, %{0 => 0, 1 => 1})
  end

end
