defmodule HangmanPlayer do
  alias HangmanPlayer.Start

  defdelegate play_hangman(), to: Start

end
