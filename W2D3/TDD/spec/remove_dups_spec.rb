require "remove_dups"

describe "my_uniq" do

    it "does not allow Array#uniq" do
      arr = [1,2,3]
      expect(arr).not_to receive(:uniq)
      my_uniq(arr)
    end

    it "returns input array if no duplicates" do
      expect(my_uniq([1,2,3])).to eq([1,2,3])
    end

    it "returns an array with no duplicates" do
      expect(my_uniq([1,2,2,3,4,3])).to eq([1,2,3,4])
    end
end
