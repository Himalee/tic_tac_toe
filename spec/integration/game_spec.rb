require "game"

describe Game do
  it "returns marked board given numbers from console" do
    board = Board.new(9)
    input = StringIO.new("1\n4\n2\n5\n3")
    output = StringIO.new
    console = Console.new(output, input)
    message = Message.new
    display = Display.new(console, message)
    game = Game.new(display, board)
    game.play
    expect(output.string).to include("[X] [X] [X] \n[O] [O] [6] \n[7] [8] [9] \n")
  end
end
