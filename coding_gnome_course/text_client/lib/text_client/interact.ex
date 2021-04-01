defmodule TextClient.Interact do
  alias TextClient.{ State, Player }

  @hangman_server :hangman@J3E43MCLPH
  def start() do
    new_game()
    |> setup_state()
    |> Player.play()
  end

  def play(state) do
    play(state)
  end

  def setup_state({ game, tally }) do
    %State{
      game_service: game,
      tally: tally
    }
  end

  def setup_state(game) do
    setup_state({ game, Hangman.tally(game) })
  end

  defp new_game() do
    :rpc.call(@hangman_server, Hangman, :new_game, [])
  end

end
