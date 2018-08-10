require "validator"

describe Validator do

  before :each do
    grid = (1..9).to_a
    @board = Board.new(grid)
    @validator = Validator.new(@board)
  end

  it "returns true given valid choice" do
    expect(@validator.cell?(1)).to be true
  end

  it "returns false given invalid choice" do
    @board.mark_board(1, "X")
    expect(@validator.cell?(1)).to be false
  end
end
