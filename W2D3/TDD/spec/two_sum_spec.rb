require "two_sum"

describe "Array" do
  subject(:array) {Array.new}

  describe "#two_sum" do
    it "returns [] if the original array is empty" do
      expect(array.two_sum).to eq([])
    end

    it "returns [] if the original array has only 1 element" do
      array << 4
      expect(array.two_sum).to eq([])
    end

    it "returns [] when no matches sum to zero" do
      array.concat([1,2,3])
      expect(array.two_sum).to eq([])
    end

    it "returns indexies for pairs that sum to zero" do
      array.concat([1,2,3,-2,-1])
      expect(array.two_sum).to eq([[0, 4], [1, 3]])
    end
  end
end
