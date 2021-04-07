defmodule GallowsWeb.HangmanController do
  use GallowsWeb, :controller

  def new_game(conn, _params) do
    render(conn, "new_game.html")
  end

  def create_game(conn, _params) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)

    conn
    |> put_session(:game, game)
    |> render_game_page(tally)
  end

  def make_move(conn, params) do
    guess = params["make_move"]["guess"]

    tally = conn
    |> get_session(:game)
    |> Hangman.make_move(guess)

    put_in(conn.params["make_move"]["guess"], "")
    |> render_game_page(tally)
  end

  def render_game_page(conn, tally),
    do: render(conn, "game_field.html", tally: tally)

end
