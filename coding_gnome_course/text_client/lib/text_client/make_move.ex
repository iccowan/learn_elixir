defmodule TextClient.MakeMove do

  defdelegate make_move(game, guess), to: Hangman

end
