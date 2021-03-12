defmodule TextClient.Player do
  alias TextClient.{ Display, MakeMove, Prompt, State }

  # won, lost, good guess, bad guess, letter already used,
  # invalid input, initializing
  def play(%State{game_service: %{game_state: :won}}) do
    exit_with_message("Congrats, you won the game!")
  end

  def play(%State{game_service: %{game_state: :lost}}) do
    exit_with_message("Sorry, you lost the game...")
  end

  def play(game = %State{game_service: %{game_state: :good_guess}}) do
    game
    |> continue_with_message("That was a good guess!")
  end

  def play(game = %State{game_service: %{game_state: :bad_guess}}) do
    game
    |> continue_with_message("That is not in the word...")
  end

  def play(game = %State{game_service: %{game_state: :already_guessed}}) do
    game
    |> continue_with_message("You've already used that letter!")
  end

  def play(game = %State{game_service: %{game_state: :invalid_guess}}) do
    game
    |> continue_with_message("Invalid guess. Please guess a single, lowecase letter.")
  end

  def play(game) do
    continue(game)
  end

  defp continue(game) do
    {game, guess} = game
    |> Display.display()
    |> Prompt.prompt()

    MakeMove.make_move(game, guess)
    |> play()
  end

  defp exit_with_message(msg) do
    IO.puts msg
    exit(:normal)
  end

  defp continue_with_message(game, msg) do
    IO.puts msg
    continue(game)
  end

end
