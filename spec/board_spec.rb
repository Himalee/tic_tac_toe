require "board"

describe Board do

  before :each do
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @board = Board.new(@grid)
  end

  let :mark { "X" }

  it "returns a marked board given number 1" do
    cell_number = 1
    new_board = @board.new_board(cell_number, mark)
    expect(new_board.grid).to eql(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 2 and 3" do
    new_board = @board.new_board(2, mark)
    another_new_board = new_board.new_board(3, mark)
    expect(another_new_board.grid).to eql([1, "X", "X", 4, 5, 6, 7, 8, 9])
  end

  it "returns false given board with no wins" do
    expect(@board.win?(@grid)).to be false
  end

  it "returns true given board with a winning row" do
    grid = ["X", "X", "X", 4, 5, 6, 7, 8, 9]
    expect(@board.win?(grid)).to be true
  end

  it "returns true given board with a winning column" do
    grid = ["X", 2, 3, "X", 5, 6, "X", 8, 9]
    expect(@board.win?(grid)).to be true
  end

  it "returns true given board with a winning diagonal" do
    grid = ["X", 2, 3, 4, "X", 6, 7, 8, "X"]
    expect(@board.win?(grid)).to be true
  end

  it "returns winning mark X" do
    grid = ["X", "X", "X", 4, 5, 6, 7, 8, 9]
    expect(@board.winning_mark(grid)).to eql("X")
  end

  it "returns nil winning mark" do
    grid = ["X", 2, 3, 4, 5, 6, 7, 8, 9]
    expect(@board.winning_mark(grid)).to be nil
  end
end
