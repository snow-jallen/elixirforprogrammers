defmodule ListsTest do
  use ExUnit.Case
  doctest Lists

  test "length of 1 is 1" do
    assert Lists.len([1]) == 1
  end
end
