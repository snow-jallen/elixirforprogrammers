defmodule Lists do
  def len([]), do: 0

  def len([_head | tail]), do: 1 + len(tail)

  def double([]), do: []
  def double([head | tail]), do: [2 * head | double(tail)]

  @doc """
    iex> Lists.sum_pairs([])
    []

    iex> Lists.sum_pairs([1,2])
    [3]

    iex> Lists.sum_pairs([1,2,3])
    [3,3]

    iex> Lists.sum_pairs([1,2,3,4])
    [3,7]
  """
  def sum_pairs([]), do: []
  def sum_pairs([h1,h2|t]), do: [h1+h2|sum_pairs(t)]
  def sum_pairs([h1]), do: [h1]

  def is_even?([]), do: false
  @doc """
  is_even?/1

  ## Examples

      iex> Lists.is_even?([1,2,3])
      false

      iex> Lists.is_even?([1,2,3,4])
      true
  """
  def is_even?(h), do: (len(h) |> rem(2)) == 0
end

