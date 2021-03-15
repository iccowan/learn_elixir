defmodule Dictionary do
  alias Dictionary.WordList

  defdelegate start(), to: WordList
  defdelegate random_word(word_list), to: WordList

  def random_word do
    word_list()
    |> Enum.random
  end

  def word_list do
    "../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!
    |> String.split(~r/\n/)
  end

end
