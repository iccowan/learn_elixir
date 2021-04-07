defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view
  import Gallows.Views.Helpers.GameStateHelper

  def game_over?(%{ game_state: game_state }),
    do: game_state in [ :won, :lost ]

  def new_game_button(conn),
    do: button("New Game", to: Routes.hangman_path(conn, :create_game))

  defp turn(left, target) when target >= left,
    do: ""

  defp turn(_left, _target),
    do: "faint"

end
