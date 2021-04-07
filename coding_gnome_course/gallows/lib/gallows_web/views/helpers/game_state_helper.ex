defmodule Gallows.Views.Helpers.GameStateHelper do
  import Phoenix.HTML, only: [ raw: 1 ]

  @responses %{
    :won => { :success, "You won!" },
    :lost => { :danger, "You lost!" },
    :good_guess => { :success, "Good guess!" },
    :bad_guess => { :warning, "Bad guess!" },
    :already_guessed => { :info, "You already guessed that..." },
    :initializing => { :primary, "Make a guess below to begin!" },
  }

  def word_so_far(tally) do
    tally.letters
    |> Enum.join()
  end

  def game_state(state) do
    @responses[state]
    |> alert()
  end

  defp alert({ class, message }) do
    """
    <div class="alert alert-#{class}">
      #{message}
    </div>
    """
    |> raw()
  end

  defp alert(nil),
    do: ""

end
