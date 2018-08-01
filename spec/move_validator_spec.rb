require "move_validator"

describe MoveValidator do

  before :each do
    @board = Board.new(3)
    @validator = MoveValidator.new(@board)
  end
  it "returns true given valid choice" do
    expect(@validator.valid_cell?(1)).to be true
  end

  it "returns false given invalid choice" do
    @board.mark_board(1, "X")
    expect(@validator.valid_cell?(1)).to be false
  end
end
