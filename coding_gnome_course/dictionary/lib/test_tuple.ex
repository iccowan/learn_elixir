defmodule TestTuple do

  def flip_tuple({a, b}), do: {b, a}

  def are_same({a, a}), do: true
  def are_same({_a, _b}), do: false

end
