require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = deck
    populate
  end

  def populate
    @deck = []

    values = (2..14).to_a
    suits = %i(spades clubs hearts diamonds)

    suits.each do |suit|
      values.each do |val|
        @deck << Card.new(val, suit)
      end
    end
  end

  def shuffle!
    @deck.shuffle
  end

  def self.in_bounds
    (2..14).to_a
  end

  def each(&block)
    @deck.each(&block)
  end

  def render
    @deck.each do |card|
      print "\u1f0e5"
      print "\n"
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  Deck.new.render
end
