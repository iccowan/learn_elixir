defmodule HelloWeb.HelloIanView do
    use HelloWeb, :view
    use Phoenix.LiveView

    def render(assigns) do
        ~L"""
        Counter: <%= @count %>
        """
    end

    def mount(_params, %{"current_user_id" => user_id}, socket) do
        temperature = count
        {:ok, assign(socket, :temperature, temperature)}
    end
end
