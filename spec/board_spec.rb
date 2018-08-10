require "board"

describe Board do

  before :each do
    @grid = (1..9).to_a
    @board = Board.new(@grid)
  end

  let :mark { "X" }

  it "returns a marked board given number 1" do
    cell_number = 1
    @board.mark_board(cell_number, mark)
    expect(@board.grid).to eql(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 2 and 3" do
    @board.mark_board(2, mark)
    @board.mark_board(3, mark)
    expect(@board.grid).to eql([1, "X", "X", 4, 5, 6, 7, 8, 9])
  end

  it "returns possible rows" do
    expect(@board.possible_rows(@grid)).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end

  it "returns possible columns" do
    expect(@board.possible_columns(@grid)).to eql([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it "returns possible diagonals" do
    expect(@board.possible_diagonals(@grid)).to eql([[1, 5, 9], [3, 5, 7]])
  end

  it "returns false given board with no wins" do
    expect(@board.win?(@grid)).to be false
  end

  it "returns true given board with a winning row" do
    grid = ["X", "X", "X", 4, 5, 6, 7, 8, 9]
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
