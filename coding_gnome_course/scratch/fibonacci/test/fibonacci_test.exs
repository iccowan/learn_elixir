defmodule FibonacciTest do
  use ExUnit.Case
  doctest Fibonacci

  test "Randomly selected nth terms of the Fibonaccionacci sequence are correct" do
    # 0
    assert Fibonacci.fib(0) == 0

    # 1
    assert Fibonacci.fib(1) == 1

    # 2
    assert Fibonacci.fib(2) == 1

    # 3
    assert Fibonacci.fib(3) == 2

    # 10
    assert Fibonacci.fib(10) == 55

    #42
    assert Fibonacci.fib(42) == 267914296

    #101
    assert Fibonacci.fib(101) == 573147844013817084101

    # 126
    assert Fibonacci.fib(126) == 96151855463018422468774568

    #242
    assert Fibonacci.fib(242) == 168083057059453008835412295811648513482449585399521
  end
end
