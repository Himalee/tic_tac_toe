require "game"

describe Game do
  it "returns marked board given number from console" do
    board = Board.new(9)
    input = StringIO.new("3")
    output = StringIO.new
    console = Console.new(output, input)
    message = Message.new
    display = Display.new(console, message)
    game = Game.new(display, board)
    game.play
    expect(output.string).to include("1 2 X\n4 5 6\n7 8 9\n")
  end
end
