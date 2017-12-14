require "card"

describe "Card" do
  subject(:card) { Card.new(:four, :heart) }
  describe "#initialize" do
    it "passes the value into @value" do
      expect(card.value).to eq(:four)
    end

    it "passes the suit into @suit" do
      expect(card.suit).to eq(:heart)
    end
  end
end
