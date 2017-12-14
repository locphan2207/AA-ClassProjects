require "my_transpose"

describe "my_transpose" do
  subject(:matrix) {Array.new}

  it "returns [] if the array is empty" do
    expect(my_transpose(matrix)).to eq([])
  end

  it "raise error if argument is not matrix" do
    matrix.concat([[1], 2])
    expect{my_transpose(matrix)}.to raise_error("Need to be a matrix (2d array)")
  end

  it "returns transpose of matrix" do
    matrix.concat([[1,2,3], [4,5,6], [7,8,9]])
    expect(my_transpose(matrix)).to eq([[1,4,7], [2,5,8], [3,6,9]])
  end
end
