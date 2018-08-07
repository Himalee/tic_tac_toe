require "player"
require "min_max"
require "move_validator"
require "game"
require "board"
require "human_player"
require "peg"

describe MinMax do

  it "minimax - one move left" do
    board = Board.new(3)
    grid = ["X", "O", "X", "O", "O", "X", "X", 8, "O"]
    min_max = MinMax.new(board)
    expect(min_max.minmax(grid, 0, "X")).to eql(8)
  end

  it "minimax - two moves left" do
    board = Board.new(3)
    grid = ["X", "O", "O", "O", "X", "O", 7, "O", 9]
    min_max = MinMax.new(board)
    expect(min_max.minmax(grid, 0, "X")).to eql(9)
  end

  it "minimax - three moves left" do
    board = Board.new(3)
    grid = ["X", "X", 3, "O", "O", 6, 7, "O", "O"]
    min_max = MinMax.new(board)
    expect(min_max.minmax(grid, 0, "X")).to eql(3)
  end

  it "minimax - four moves left" do
    board = Board.new(3)
    grid = [1, "O", "O", 4, "O", 6, "X", "X", 9]
    min_max = MinMax.new(board)
    expect(min_max.minmax(grid, 0, "X")).to eql(9)
  end

  it "minimax - five moves left" do
    board = Board.new(3)
    grid = ["O", "X", 3, 4, 5, 6, 7, "X", "O"]
    min_max = MinMax.new(board)
    expect(min_max.minmax(grid, 0, "X")).to eql(5)
  end
end
