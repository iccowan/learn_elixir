defmodule MessengerWeb.SetUserNameLive do
    use MessengerWeb, :live_view

    def mount(_params, session, socket) do
        {:ok, assign(socket, name: session["name"])}
    end

end
