defmodule Procs do

  def greeter(what_to_say, count) do
    receive do
      {:boom, reason} ->
        exit(reason)
      {:stop} ->
        exit(:normal)
      {:add, number_to_add} ->
        greeter(what_to_say, count + number_to_add)
      {:reset} ->
        greeter(what_to_say, 0)
      msg ->
        IO.puts "#{what_to_say} #{msg} (Current count: #{count})"
    end
    greeter(what_to_say, count+2)
  end

end
