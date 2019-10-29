defmodule Cards do

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


  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
    # returns a tuple -- can be accessed with pattern matching like { hand, rest_of_deck } = Cards.deal()
  end


  def save_file(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

end
