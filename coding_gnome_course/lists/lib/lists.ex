defmodule Lists do

  def len([]), do: 0
  def len([_ | t]), do: 1 + len(t)

  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)

  def map([], _func), do: []
  def map([h | t], func), do: [func.(h) | map(t, func)]

  def sum_pairs([]), do: []
  def sum_pairs([a, b | t]), do: [a + b | sum_pairs(t) ]

  def even_length?([_, _ | t]), do: even_length?(t)
  def even_length?([_ | _]), do: false
  def even_length?([]), do: true

end
