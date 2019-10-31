defmodule CodinggnomeTest do
  use ExUnit.Case
  doctest Codinggnome

  test "greets the world" do
    assert Codinggnome.hello() == :world
  end
end
