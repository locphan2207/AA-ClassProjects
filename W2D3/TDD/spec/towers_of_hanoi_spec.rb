require 'towers_of_hanoi'

describe "TowersOfHanoi" do
  subject(:towers) { TowersOfHanoi.new }

  describe "#initialize" do
    it "start_tower has 3 disks" do
      expect(towers[0]).to eq([3, 2, 1])
    end

    it "end_tower is empty" do
      expect(towers[1]).to eq([])
    end

    it "extra_tower is empty" do
      expect(towers[2]).to eq([])
    end
  end

  describe "#move" do
    it "moves the disk" do
      towers.move(0, 1)
      expect(towers[0]).to eq([3, 2])
      expect(towers[1]).to eq([1])
    end

    it "raises 'Empty tower' if start tower is empty" do
      expect { towers.move(2, 0) }.to raise_error("Empty tower")
    end

    it "raises exception if you move larger disk onto smaller disk" do
      towers.move(0, 1)
      expect { towers.move(0, 1) }.to raise_error("Bad disk order")
    end
  end

  describe "#won?" do
    it "returns true when end_tower's length is 3" do
      towers.move(0, 1)
      towers.move(0, 2)
      towers.move(1, 2)
      towers.move(0, 1)
      towers.move(2, 1)
      towers.move(2, 0)
      towers.move(1, 2)
      towers.move(0, 1)
      towers.move(2, 1)

      expect(towers.won?).to eq(true)
    end
  end
end
