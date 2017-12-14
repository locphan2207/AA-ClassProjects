require "deck"

describe "Deck" do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates a deck with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe "#shuffle" do
    it "shuffle the cards" do
      start_order = Deck.new
      deck.shuffle
      expect(deck.cards[0].value).not_to eq(start_order.cards[0].value)
    end
  end

  describe "#draw" do
    it "should no longer contain cards which were drawn" do
      drawn_cards = deck.draw(3)
      expect(deck.cards).not_to include(drawn_cards)
    end
  end
end
