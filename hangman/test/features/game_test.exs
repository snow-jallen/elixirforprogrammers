defmodule Hangman.GameCabbageTest do
  use Cabbage.Feature, async: false, file: "game.feature"
  alias Hangman.Game

  setup do
    on_exit fn -> IO.puts "on_exit event raised.  Scenario testing is complete" end

  end

  defgiven ~r/I have a new game with the word (?<word>.*)/, %{word: word}, %{} do
    game = Game.new_game(word)
    IO.puts "In the 'given'"
    IO.inspect game
    {:ok, %{game: game}}
  end

  defwhen ~r/I guess (?<guess>.*)/, %{guess: guess}, %{game: game} do
    game = Game.make_move(game, guess)
    IO.puts "In the 'when'"
    IO.inspect game
    {:ok, %{game: game}}
  end

  defthen ~r/^the number of turns left is (?<expected>\d+)$/, %{expected: expected_str}, %{game: {game, _tally}} do
    IO.puts "Expected: #{expected_str}"
    IO.inspect game
    {expected, _} = Integer.parse(expected_str)
    assert game.turns_left == expected
  end
end
