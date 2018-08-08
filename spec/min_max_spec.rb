require "player"
require "min_max"
require "validator"
require "game"
require "board"
require "human_player"
require "mark"

describe MinMax do

  before :each do
    board = Board.new(3)
    @min_max = MinMax.new(board)
  end

  context "X - maximizer" do
    it "one move left" do
      grid = ["X", "O", "X", "O", "O", "X", "X", 8, "O"]
      expect(@min_max.get_best_move(grid, "X")).to eql(8)
    end

    it "two moves left" do
      grid = ["X", "O", "O", "O", "X", "O", 7, "O", 9]
      expect(@min_max.get_best_move(grid, "X")).to eql(9)
    end

    it "three moves left" do
      grid = ["X", "X", 3, "O", "O", 6, 7, "O", "O"]
      expect(@min_max.get_best_move(grid, "X")).to eql(3)
    end

    it "four moves left" do
      grid = ["X", "O", 3, "O", "X", 6, "O", 8 , 9]
      expect(@min_max.get_best_move(grid, "X")).to eql(9)
    end

    it "five moves left" do
      grid = ["O", "X", 3, 4, 5, 6, 7, "X", "O"]
      expect(@min_max.get_best_move(grid, "X")).to eql(5)
    end

    it "trap" do
      grid = ["O", 2, 3, 4, "X", "O", 7, 8, "X"]
      expect(@min_max.get_best_move(grid, "X")).to eql(3).or(eq(7))
    end
  end

  context "O - maximizer" do
    it "stopping opponent from winning" do
      grid = ["X", 2, "X", 4, "O", "O", 7, 8, 9]
      expect(@min_max.get_best_move(grid, "O")).to eql(2)
    end
  end
end
