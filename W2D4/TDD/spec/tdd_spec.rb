require 'tdd'


describe "#remove_dups" do
  subject(:arg) {[1,2,3,3,4,4,5]}
  subject(:arg_uniq) { remove_dups(arg) }

  it "should not call #uniq method" do

    expect(arg).to_not receive(:uniq)
    remove_dups(arg)
  end

  it "should remove duplicate values" do
    expect(remove_dups(arg)).to eq([1,2,3,4,5])
  end


end

describe "two_sum" do
  subject(:array) {[1,-1,3,-3,4,4,5]}
  it "should return pairs that sum to zero" do
    expect(two_sum(array)).to eq([[0,1],[2,3]])
  end

  it "should raise error if arguemnt isn't array" do
    array = "123456"
    expect {two_sum(array)}.to raise_error(NoMethodError)
  end
end

describe "#my_transpose" do
  subject(:array) { [[0,1,2],[3,4,5],[6,7,8]]}
    it "should convert row and column representations" do
      expect(my_transpose(array)).to eq([[0,3,6],[1,4,7],[2,5,8]])
    end

    it "should return empty array if argument is an empty array" do
      array = []
      expect(my_transpose([])).to eq([])
    end
end

describe "#stock_picker" do
  subject(:array) {[0,2,1,4,1,50]}
    it "should find most profitable pair" do
      expect(stock_picker(array)).to eq([0,5])
    end
end
