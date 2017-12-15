require 'deck'

describe "Deck" do

  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "should populate a deck with 52 cards" do
      expect(deck.deck.length).to eq(52)
    end

    it "should create 13 spades cards" do
      all_spades = deck.deck.select { |card| card.suit == :spades }
      expect(all_spades.length).to eq(13)
    end

    it "should create 13 hearts cards" do
      all_hearts = deck.deck.select { |card| card.suit == :hearts }
      expect(all_hearts.length).to eq(13)
    end

    it "should create 13 clubs cards" do
      all_clubs = deck.deck.select { |card| card.suit == :clubs }
      expect(all_clubs.length).to eq(13)\
    end

    it "should create 13 diamonds cards" do
      all_diamonds = deck.deck.select { |card| card.suit == :diamonds }
      expect(all_diamonds.length).to eq(13)
    end
  end

  describe "#shuffle!" do
    it "should shuffle the deck to a randomized card order" do
      control_deck = Deck.new
      deck.shuffle!
      expect(control_deck).to_not eq(deck)
    end
  end

end
