require "board"

describe Board do

  before :each do
    size = 3
    @board = Board.new(size)
  end

  let :mark { "X" }

  it "returns 3x3 grid" do
    expect(@board.create_grid).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 1" do
    cell_number = 1
    @board.mark_board(cell_number, mark)
    expect(@board.grid).to eql(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 2" do
    cell_number = 2
    @board.mark_board(cell_number, mark)
    expect(@board.grid).to eql([1, "X", 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns possible rows" do
    expect(@board.possible_rows).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end

  it "returns possible columns" do
    expect(@board.possible_columns).to eql([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it "returns possible diagonals" do
    expect(@board.possible_diagonals).to eql([[1, 5, 9], [3, 5, 7]])
  end

  it "returns false given board with no wins" do
    expect(@board.win?).to be false
  end

  it "returns true given board with a winning row" do
    @board.mark_board(1, "X")
    @board.mark_board(2, "X")
    @board.mark_board(3, "X")
    expect(@board.win?).to be true
  end

  it "returns winning mark X" do
    @board.mark_board(1, "X")
    @board.mark_board(2, "X")
    @board.mark_board(3, "X")
    expect(@board.winning_mark).to eql("X")
  end

  it "returns nil winning mark" do
    @board.mark_board(1, "X")
    expect(@board.winning_mark).to be nil
  end
end
