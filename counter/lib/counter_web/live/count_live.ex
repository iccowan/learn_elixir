defmodule CounterWeb.CountLive do
    use CounterWeb, :live_view

    def mount(_params, _session, socket) do
        {:ok, fetch(socket, 0, false, false)}
    end

    def handle_event("add", %{"val" => val}, socket) do
        {:noreply, fetch(socket, Integer.parse(val) |> elem(0), true, false)}
    end

    def handle_event("remove", %{"val" => val}, socket) do
        {:noreply, fetch(socket, Integer.parse(val) |> elem(0), false, true)}
    end

    defp fetch(socket, val, inc, dec) do
        cond do
            inc -> assign(socket, count: inc_count(val))
            dec -> assign(socket, count: dec_count(val))
            true -> assign(socket, count: val)
        end
    end

    def inc_count(count), do: count + 1
    def dec_count(count), do: count - 1

end
