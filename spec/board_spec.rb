require "board"

describe Board do
  it "returns 3x3 grid" do
    size = 9
    board = Board.new(size)
    expect(board.create_grid).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it "returns 5x5 grid" do
    size = 25
    board = Board.new(size)
    expect(board.create_grid).to eql((0..24).to_a)
  end
end
