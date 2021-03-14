defmodule HangmanPlayerTest do
  use ExUnit.Case
  doctest HangmanPlayer

  test "greets the world" do
    assert HangmanPlayer.hello() == :world
  end
end
