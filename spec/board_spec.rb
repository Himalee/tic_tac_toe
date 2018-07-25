require "board"

describe Board do
  it "returns 3x3 grid" do
    size = 9
    board = Board.new(size)
    expect(board.create_grid).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns 5x5 grid" do
    size = 25
    board = Board.new(size)
    expect(board.create_grid).to eql((1..25).to_a)
  end

  it "returns a marked board given number 1" do
    size = 9
    board = Board.new(size)
    number = 1
    mark = "X"
    board.mark_board(number, mark)
    expect(board.grid).to eql(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "returns a marked board given number 2" do
    size = 9
    board = Board.new(size)
    number = 2
    mark = "X"
    board.mark_board(number, mark)
    expect(board.grid).to eql([1, "X", 3, 4, 5, 6, 7, 8, 9])
  end
end
