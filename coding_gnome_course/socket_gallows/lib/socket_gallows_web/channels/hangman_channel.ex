defmodule SocketGallowsWeb.HangmanChannel do
  use Phoenix.Channel

  require Logger

  def join("hangman:game", _, socket) do
    game = Hangman.new_game()
    socket = assign(socket, :game, game)
    { :ok, socket }
  end

  def handle_in("tally", _msg, socket) do
    tally = socket.assigns.game
            |> get_tally()

    push(socket, "tally", tally)
    { :noreply, socket }
  end

  def handle_in(incoming, _msg, socket) do
    Logger.error("Invalid incoming request " <> incoming)
    push(socket, incoming, %{ error: "ERROR: No implementation handles
      the request" <> incoming})
    { :noreply, socket }
  end

  defp get_tally(game) do
    Hangman.tally(game)
    |> serialize_tally()
  end

  defp serialize_tally(tally = %{ letters_used: letters }) do
    letters = MapSet.to_list(letters)
    %{ tally | letters_used: letters }
  end

end
