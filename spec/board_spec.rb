require "board"

describe Board do

  before :each do
    size = 9
    @board = Board.new(size)
  end

  let :mark { "X" }

  it "returns 3x3 grid" do
    expect(@board.create_grid).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 1" do
    number = 1
    @board.mark_board(number, mark)
    expect(@board.grid).to eql(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 2" do
    number = 2
    @board.mark_board(number, mark)
    expect(@board.grid).to eql([1, "X", 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns possible rows" do
    expect(@board.possible_rows).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end

  it "returns one possible column" do
    expect(@board.add_column(0)).to eql([1, 4, 7])
  end

  it "returns possible columns" do
    expect(@board.possible_columns).to eql([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it "returns first possible diagonal" do
    expect(@board.add_diagonal(0, :+)).to eql([1, 5, 9])
  end

  it "returns possible diagonals" do
    expect(@board.possible_diagonals).to eql([[1, 5, 9], [3, 5, 7]])
  end
end
