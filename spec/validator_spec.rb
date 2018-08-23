require "validator"
require "board"

describe Validator do

  it "returns true given valid choice" do
    grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    board = Board.new(grid)
    validator = Validator.new
    expect(validator.cell?(board, 1)).to be true
  end

  it "returns false given invalid choice" do
    grid = ["X", 2, 3, 4, 5, 6, 7, 8, 9]
    board = Board.new(grid)
    validator = Validator.new
    expect(validator.cell?(board, 1)).to be false
  end
end
