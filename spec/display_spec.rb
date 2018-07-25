require "display"

describe Display do
  it "presents 3x3 board" do
    board = Board.new(9)
    output = StringIO.new
    console = Console.new(output)
    display = Display.new(console)
    display.present_board(board.grid)
    expect(output.string).to eql("1 2 3\n4 5 6\n7 8 9\n")
  end

  it "presents 2x2 board" do
    board = Board.new(4)
    output = StringIO.new
    console = Console.new(output)
    display = Display.new(console)
    display.present_board(board.grid)
    expect(output.string).to eql("1 2\n3 4\n")
  end
end
