ExUnit.start()

defmodule FibTest do
  use ExUnit.Case
  doctest Fib

  test "Randomly selected nth terms of the Fibonacci sequence are correct" do
    # 0
    assert Fib.fib(0) == 0

    # 1
    assert Fib.fib(1) == 1

    # 2
    assert Fib.fib(2) == 1

    # 3
    assert Fib.fib(3) == 2

    # 10
    assert Fib.fib(10) == 55

    #42
    assert Fib.fib(42) == 267914296

    #101
    assert Fib.fib(101) == 573147844013817084101

    # 126
    assert Fib.fib(126) == 96151855463018422468774568

    #242
    assert Fib.fib(242) == 168083057059453008835412295811648513482449585399521
  end
end
