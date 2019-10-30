defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards 
  """

  @doc """
    Returns a list of strings representing a list of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "One", "four", "five", "six", "seven"]
    suits = ["spades", "clubs", "hearts", "diamonds"]
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
      end
  end

  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many hands to deal

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand 
      ["Ace of spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
    # returns a tuple -- can be accessed with pattern matching like { hand, rest_of_deck } = Cards.deal()
  end

  def save_file(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load_file(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "File does not exist"
    end
  end

  def deal_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size) #pipe operator is automatically adding the first arg to deal method, second arg is hand size
  end

end
