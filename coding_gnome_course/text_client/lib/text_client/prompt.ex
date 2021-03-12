defmodule TextClient.Prompt do

  def prompt(game) do
    guess = IO.gets "Your next guess: "
    {game, guess}
  end

end
