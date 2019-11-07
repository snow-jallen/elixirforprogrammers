defmodule Dictionary.WordList  do

  def start() do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

  def random_word(words) do
    words
    |> Enum.random()
    |> String.trim()
  end

end
