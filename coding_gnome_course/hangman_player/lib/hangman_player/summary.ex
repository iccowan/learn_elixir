defmodule HangmanPlayer.Summary do

  def display(game = %{ tally: tally }) do
    IO.puts [
      "\n",
      "Word so far: #{ Enum.join(tally.letters, "") }\n",
      "Guessed left: #{ tally.turns_left }\n",
      "Letters guessed: #{ Enum.join(game.game.used, ", ") }"
    ]

    game
  end

end
