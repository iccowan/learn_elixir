defmodule Fib do

  def get_val(n, pid) do
    Agent.get(
          pid,
          fn cache ->
            Map.fetch(cache, n)
          end
        )
  end

  def fib(_n_low, 0, false, _pid), do: 0
  def fib(_n_low, 1, false, _pid), do: 1
  def fib(_n_low, n, false, pid) do
    { :ok, val1 } = get_val(n - 1, pid)
    { :ok, val2 } = get_val(n - 2, pid)
    val1 + val2
  end

  def fib(n_low, n, true, pid) do
    { :ok, val1 } = get_val(n_low - 1, pid)
    { :ok, val2 } = get_val(n_low - 2, pid)
    val = val1 + val2

    Agent.update(
      pid,
      fn cache ->
        Map.put_new(cache, n_low, val)
      end
    )

    fib(n_low + 1, n, (n_low + 1) < n, pid)
  end

  def fib(n) do
    { :ok, pid } = Agent.start_link(
      fn ->
        %{
          0 => 0,
          1 => 1
        }
      end
    )

    val = fib(2, n, 2 < n, pid)

    Agent.stop(pid)
    val
  end

end
