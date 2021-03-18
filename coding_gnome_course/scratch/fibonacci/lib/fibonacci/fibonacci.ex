defmodule Fibonacci.Fibonacci do

  @me __MODULE__

  def start_link() do
    Agent.start_link(
      fn ->
        %{
          0 => 0,
          1 => 1
        }
      end,
      name: @me
    )
  end

  defp cache(val, n) do
    Agent.update(
      @me,
      fn cache ->
        Map.put_new(cache, n, val)
      end
    )

    val
  end

  defp complete_val(nil, n) do
    fib(n - 1) + fib(n - 2)
    |> cache(n)
  end

  defp complete_val(val, _n), do: val

  def get_val(n) do
    Agent.get(
          @me,
          fn cache ->
            cache[n]
          end
        )
    |> complete_val(n)
  end

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: get_val(n - 1) + get_val(n - 2)

end
