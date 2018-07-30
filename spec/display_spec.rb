require "display"
require "message"

describe Display do
  it "presents 3x3 board" do
    board = Board.new(3)
    output = StringIO.new
    console = Console.new(output)
    message = Message.new
    display = Display.new(console, message)
    display.present_board_with_squares(board)
    expect(output.string).to eql("[1] [2] [3] \n[4] [5] [6] \n[7] [8] [9] \n")
  end
end
