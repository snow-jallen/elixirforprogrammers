defmodule GameTest do
  use ExUnit.Case
  alias Hangman.Game

  doctest Hangman.Game

  test "new_game returns sturcture" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing

    letters = game.letters |> Enum.join
    assert Regex.match?(~r/^([a-z]*)/, letters)
  end

  test "state isn't changed for :won or :lost game" do
    for state <- [ :won, :lost] do
      game = Game.new_game() |> Map.put(:game_state, state)
      assert {^game, _} = Game.make_move(game, "x")
    end
  end

  test "first occurrence of letter is not already used" do
    game = Game.new_game()
    {game, _} = Game.make_move(game, "x")
    assert game.game_state != :already_used

    {game, _} = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "a good guess is recognized" do
    game = Game.new_game("wribble")
    game = Game.make_move(game, "w")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end

  test "a guessed word is a won game" do
    game = Game.new_game("wribble")
    game = Game.make_move(game, "w")
    game = Game.make_move(game, "r")
    game = Game.make_move(game, "i")
    game = Game.make_move(game, "b")
    game = Game.make_move(game, "b")
    game = Game.make_move(game, "l")
    game = Game.make_move(game, "e")
    assert game.game_state == :won
    assert game.turns_left == 7
  end

  test "bad guess is recognized" do
    game = Game.new_game("wibble")
    game = Game.make_move(game, "x")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end

  test "bad guess runs out of guesses" do
    game = Game.new_game("w")
    game = Game.make_move(game, "a")
    IO.inspect game
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end
end


