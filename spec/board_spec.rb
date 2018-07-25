require "board"

describe Board do

  before :each do
    size = 9
    @board = Board.new(size)
  end

  it "returns 3x3 grid" do
    expect(@board.create_grid).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 1" do
    number = 1
    mark = "X"
    @board.mark_board(number, mark)
    expect(@board.grid).to eql(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 2" do
    number = 2
    mark = "X"
    @board.mark_board(number, mark)
    expect(@board.grid).to eql([1, "X", 3, 4, 5, 6, 7, 8, 9])
  end
end
