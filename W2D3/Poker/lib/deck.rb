require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    populate
  end

  def shuffle
    @cards.shuffle!
  end

  def draw(amount)
    result = []
    amount.times { result << @cards.pop }
    result
  end

  private

  SUITS = %w[♠ ♥ ♦ ♣].freeze
  VALUES = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze

  def populate
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

end
