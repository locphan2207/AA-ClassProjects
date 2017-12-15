require 'towers_of_hanoi'

describe "Board" do
  subject(:game) { Towers.new }

  describe "#initialize" do
    it "should initialize board with proper layout" do
      expect(game.board).to eq([[1,2,3],[],[]])
    end
  end

  describe "#move" do
    before(:each) { game.move(0,1) }

    it "should remove top object from from_tower" do
      expect(game.board[0]).to eq([2,3])
    end

    it "should place object at top of to_tower" do
      expect(game.board[1]).to eq([1])
    end
  end

  describe "#won?" do
    it "should return true if either tower 2 or 3 are full" do
      game.board = [[],[1,2,3],[]]
      expect(game.won?).to eq(true)
    end

    it "should not return true if multiple tower has disks" do
      game.board = [[],[1,2],[3]]
      expect(game.won?).to eq(false)
    end
  end

end
