require "display"
require "message"
require "board"
require "console"

describe Display do

  before :each do
    @board = Board.new(3)
    @output = StringIO.new
    @message = Message.new
  end

  it "presents 3x3 board" do
    console = Console.new(@output)
    display = Display.new(console, @message)
    display.present_board_with_squares(@board)
    expect(@output.string).to eql("[1] [2] [3] \n[4] [5] [6] \n[7] [8] [9] \n")
  end

  it "validates input to play again" do
    input = StringIO.new("d\n3\nno\nN")
    console = Console.new(@output, input)
    display = Display.new(console, @message)
    expect(display.valid_play_again_response).to eql("n")
  end
end
