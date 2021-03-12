defmodule Hangman.Game do

  defstruct [
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new(),
  ]

  def new_game(word \\ Dictionary.random_word) do
    %Hangman.Game{
      letters: word |> String.codepoints
    }
  end

  def make_move(game = %{game_state: state}, _guess) when state in
  [:won, :lost], do: game

  def make_move(game, guess) do
    accept_move(game, guess, MapSet.member?(game.used, guess), valid_move?(guess))
  end

  def tally(game) do
    %{
      game_state: game.game_state,
      turns_left: game.turns_left,
      letters: game.letters |> reveal_guessed(game.used)
    }
  end

################################################################################

  defp valid_move?(letter) do
    letter
    |> String.match?(~r/^[a-z]$/)
  end

  defp accept_move(game, _guess, _already_guessed = true, _valid_guess) do
    Map.put(game, :game_state, :already_guessed)
  end

  defp accept_move(game, _guess, _already_guessed, _not_valid_guess = false) do
    %{game | game_state: :invalid_guess}
  end

  defp accept_move(game, guess, _already_guessed, _not_valid_guess) do
    Map.put(game, :used, MapSet.put(game.used, guess))
    |> score_guess(Enum.member?(game.letters, guess))
  end

  defp score_guess(game, _in_word = true) do
    new_state = MapSet.new(game.letters)
    |> MapSet.subset?(game.used)
    |> won?()

    Map.put(game, :game_state, new_state)
  end

  defp score_guess(game = %{turns_left: 1}, _not_in_word) do
    Map.put(game, :game_state, :lost)
  end

  defp score_guess(game = %{turns_left: turns_left}, _not_in_word) do
    %{game |
      game_state: :bad_guess,
      turns_left: turns_left - 1
    }
  end

  defp won?(_has_won = true), do: :won
  defp won?(_has_not_won), do: :good_guess

  defp reveal_guessed(letters, used) do
    letters
    |> Enum.map(fn letter -> reveal_letter(letter, MapSet.member?(used, letter)) end)
  end

  defp reveal_letter(letter, _in_word = true), do: letter
  defp reveal_letter(_letter, _not_in_word), do: " _ "

end
