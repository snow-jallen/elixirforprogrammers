defmodule TextClient.Summary do
  alias TextClient.State

  def display(game = %State{tally: tally, game_service: %{used: used}}) do
    IO.puts [
      "\n",
      "Word so far: #{Enum.join(tally.letters, " ")} ",
      "\n",
      "Letters used: #{Enum.join(used, " ")}",
      "\n",
      "Guesses left: #{tally.turns_left}",
      "\n",

    ]
    game
  end
end
