defmodule TextClient.Player do

  alias TextClient.{Mover, Prompter, State, Summary}

  # won, lost, good guess, bad guess, already used letter, initializing
  def play(%State{tally: %{game_state: :won}}) do
    exit_with_message("You WON!")
  end

  def play(%State{tally: %{game_state: :lost}, game_service: %{letters: actualWord}}) do
    IO.puts "The word was #{actualWord}"
    exit_with_message("Sorry, you lost. :-(")
  end

  def play(game = %State{tally: %{game_state: :good_guess}}) do
    game |> continue_with_message("Good guess!")
  end

  def play(game = %State{tally: %{game_state: :bad_guess}}) do
    game |> continue_with_message("Sorry, that isn't in the word.")
  end

  def play(game = %State{tally: %{game_state: :already_used}}) do
    game |> continue_with_message("You've already used that letter.")
  end

  def play(game = %State{}) do
    continue(game)
  end

  defp continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.move()
    |> play()

  end

  defp display(game) do
    game
  end

  defp prompt(game) do
    game
  end

  defp make_move(game) do
    game
  end

  defp continue_with_message(game, msg) do
    IO.puts(msg)
    continue(game)
  end

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end
end
