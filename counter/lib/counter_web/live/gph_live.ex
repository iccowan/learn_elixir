defmodule CounterWeb.GPHLive do
    use CounterWeb, :live_view

    def mount(_params, _session, socket) do
        {:ok, fetch(0, 1, socket)}
    end

    def fetch(gal, hours, socket) do
        assign(socket, gal: gal, hours: hours, gph: calcGPH(gal, hours), error: false)
    end

    def fetch_error(error_desc, gal, hours, socket) do
        assign(socket, gal: gal, hours: hours, gph: "ERROR", error: true)
    end

    def handle_event("calculate", %{"gal" => gal, "hours" => hours}, socket) do
        new_gal = Integer.parse(gal)

        if hours <= 0 do
            fetch_error("Cannot divide by 0: hours must be greater than 0", new_gal, hours, socket)
        else
            fetch(gal, hours, socket)
        end
    end

    def calcGPH(gal, hours), do: gal / hours
end
