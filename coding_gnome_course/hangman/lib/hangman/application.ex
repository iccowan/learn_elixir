defmodule Hangman.Application do

  use Application
  use DynamicSupervisor, restart: :transient

  def start(_type, _args) do
    Registry.start_link(keys: :unique, name: HangmanServerRegistry)

    start_link(nil)
  end

  def start_link(arg), do:
    DynamicSupervisor.start_link(__MODULE__, arg, name: __MODULE__)

  def init(_arg), do: DynamicSupervisor.init(strategy: :one_for_one)

  def new_game() do
    { :ok, pid } = start_child()
    pid
  end

  def start_child(),
    do: DynamicSupervisor.start_child(__MODULE__, { Hangman.Server, nil})

  def handle_call({ :tally }, game), do: Hangman.tally(game)

end
