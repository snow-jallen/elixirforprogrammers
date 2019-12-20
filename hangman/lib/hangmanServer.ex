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
end
