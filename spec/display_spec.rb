require "display"
require "message"

describe Display do
  it "presents 3x3 board" do
    board = Board.new(9)
    output = StringIO.new
    console = Console.new(output)
    message = Message.new
    display = Display.new(console, message)
    display.present_board(board.grid)
    expect(output.string).to eql("1 2 3\n4 5 6\n7 8 9\n")
  end
end
