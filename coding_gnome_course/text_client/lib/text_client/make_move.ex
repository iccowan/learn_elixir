defmodule TextClient.MakeMove do
  alias TextClient.Interact

  defdelegate make_move(game, guess), to: Hangman

  def make_move({ %{ game_service: game }, guess }) do
    guess = guess
    |> String.trim()

    Hangman.make_move(game, guess)
    Interact.setup_state(game)
  end

end
