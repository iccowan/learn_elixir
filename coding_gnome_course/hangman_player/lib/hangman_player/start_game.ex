defmodule HangmanPlayer.Start do
  alias HangmanPlayer.{ LetterPicker, Summary, Start }

  defstruct [
    game: nil,
    tally: nil,
    next_letter: ""
  ]

  def play_hangman() do
    game()
    |> play()
  end

  def play(%Start{game: %{game_state: :won}}) do
    exit_with_message("The computer won the game!!")
  end

  def play(%Start{game: game = %{game_state: :lost}}) do
    exit_with_message("The computer lost the game...\nThe correct word was: " <> Enum.join(game.letters))
  end

  def play(game) do
    game
    |> Summary.display()
    |> LetterPicker.pick_letter()
    |> Mover.make_move()
    |> play()
  end

  defp game() do
    game = Hangman.new_game
    %Start{
      game: game,
      tally: Hangman.tally(game)
    }
  end

  defp exit_with_message(msg) do
    IO.puts msg
    exit :normal
  end

end
