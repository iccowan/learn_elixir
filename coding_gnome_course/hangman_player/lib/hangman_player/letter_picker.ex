defmodule HangmanPlayer.LetterPicker do

  def pick_letter(game) do
    %{ game | next_letter: random_letter() }
  end

  defp random_letter() do
    "abcdefghijklmnopqrstuvwxyz"
    |> String.codepoints()
    |> Enum.random()
  end

end
