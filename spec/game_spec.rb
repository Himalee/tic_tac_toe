require "game"

describe Game do
  it "returns marked board given number from console" do
    board = Board.new(9)
    input = StringIO.new("3")
    output = StringIO.new
    console = Console.new(output, input)
    display = Display.new(console)
    game = Game.new(display, board)
    game.play
    expect(output.string).to include("1 2 X\n4 5 6\n7 8 9\n")
  end
end
