# pythag.exs
for a <- 1..100, b <- 1..100, c <- 1..100, :math.pow(a,2) + :math.pow(b,2) == :math.pow(c,2) do
  IO.inspect({a,b,c})
  IO.puts "#{:math.pow(a,2)} + #{:math.pow(b,2)} == #{:math.pow(c,2)}"
end
