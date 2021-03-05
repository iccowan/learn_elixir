defmodule HelloWeb.HelloIanController do
    use HelloWeb, :controller

    def index(conn, _params) do
        render(conn, "helloIanIndex.html")
    end

    def show(conn, %{"messenger" => messenger} = params) do
        render(conn, "show.html", messenger: messenger)
    end

    def show(conn, _params) do
        render(conn, "show.html", messenger: "No messenger specified!")
    end
end
