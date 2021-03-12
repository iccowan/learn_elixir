defmodule TextClient.Display do

  def display(%{ tally: tally }) do
    IO.puts [
      "\n",
      "Word so far: #{ Enum.join(tally.letters, "") }\n",
      "Guessed left: #{ tally.turns_left }\n"
    ]
  end

end
