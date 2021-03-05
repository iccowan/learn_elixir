defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def helloIan(conn, _params) do
      render(conn, "helloIan.html")
  end
end
