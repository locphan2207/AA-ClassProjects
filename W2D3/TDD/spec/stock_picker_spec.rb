require "stock_picker"

describe "stock_picker" do
  subject(:stock) {[]}
  it "returns [] if no stock prices" do
    expect(stock_picker(stock)).to eq([])
  end

  it "returns [] if only 1 stock price" do
    stock << 200
    expect(stock_picker(stock)).to eq([])
  end

  it "returns maximum pair of days" do
    stock.concat([1, 2, 2, 3, 1, 4, 2])
    expect(stock_picker(stock)).to eq([0,5])
  end

  it "works with descending values" do
    stock.concat([1, 0, -1, -2, -4, -7, -8])
    expect(stock_picker(stock)).to eq([0, 1])
  end
end
