defmodule Hangman do

  alias Hangman.Game

  defdelegate new_game(), to: Game
  defdelegate new_game(word), to: Game

  def make_move(game, guess) do
    game = Game.make_move(game, guess)
    {game, tally(game)}
  end
  defdelegate tally(game), to: Game

end
