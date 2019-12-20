defmodule Hangman.Server do
  use GenServer
  alias Hangman.Game

  def start_link() do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    state = Game.new_game()
    {:ok, state}
  end

  def handle_call({:make_move, guess}, _from, game) do
    {game, tally} = Game.make_move(game, guess)
    {:reply, tally, game}
  end
end
