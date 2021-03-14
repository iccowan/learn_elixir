defmodule Mover do

  def make_move(game = %{ game: hangman_game, next_letter: guess }) do
    { hangman_game, tally } = Hangman.make_move(hangman_game, guess)
    %{ game | game: hangman_game, tally: tally }
  end

end
