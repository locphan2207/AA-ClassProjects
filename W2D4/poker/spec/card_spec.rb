require 'card'



describe "Card" do

  subject(:card) { Card.new(10, :spades) }

  describe "#initialize" do
    it "should set the card's value" do
      expect(card.value).to eq(10)
    end


    it "should set the card's suit" do
      expect(card.suit).to eq(:spades)
    end
  end
end
