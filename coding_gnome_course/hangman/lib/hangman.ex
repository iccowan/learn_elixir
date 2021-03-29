defmodule Hangman do
  alias Hangman.Application

  defdelegate new_game(), to: Application

  def tally(game_pid), do:
    GenServer.call(game_pid, { :tally })

  def make_move(game_pid, guess), do:
    GenServer.call(game_pid, { :make_move, guess })

  def get_used(game_pid), do:
    GenServer.call(game_pid, { :used })

  def word(game_pid),
    do: GenServer.call(game_pid, { :word })

end
