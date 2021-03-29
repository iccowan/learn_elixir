defmodule Hangman.Server do

  alias Hangman.Game

  use GenServer, restart: :transient

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: generate_name())
  end

  def start_link(_args), do: start_link()

  defp generate_name(),
    do: { :via, Registry, { HangmanServerRegistry, generate_name_helper() } }

  defp generate_name_helper() do
    DateTime.now!("Etc/UTC")
    |> DateTime.to_unix()
    |> Integer.to_string()
    |> Kernel.<>("_hangman")
  end

  def init(_), do: { :ok, Game.new_game() }

  def handle_call({ :make_move, guess }, _from, game) do
    { game, tally } = Game.make_move(game, guess)
    { :reply, tally, game }
  end

  def handle_call({ :tally }, _from, game) do
    { :reply, Game.tally(game), game }
  end

  def handle_call({ :used }, _from, game) do
    { :reply, game.used, game }
  end

  def handle_call({ :word }, _from, game) do
    { :reply, Enum.join(game.letters), game }
  end

end
