defmodule Hangman do
  alias Hangman.Game

  defdelegate new_game, to: Game
  defdelegate tally(game), to: Game

  def make_move(game, guess) do
    {Game.make_move(game, guess), tally(game)}
  end

end
