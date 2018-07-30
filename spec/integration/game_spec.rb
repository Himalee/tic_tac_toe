require "game"
require "player"
require "peg"

describe Game do

  before :each do
    dimension = 3
    @board = Board.new(dimension)
    @output = StringIO.new
    @message = Message.new
    @player = Player.new
  end

  it "returns marked board given numbers from console" do
    input = StringIO.new("1\n4\n2\n5\n3")
    console = Console.new(@output, input)
    display = Display.new(console, @message)
    game = Game.new(display, @board, @player)
    game.play
    expect(@output.string).to include("[X] [X] [X] \n[O] [O] [6] \n[7] [8] [9] \n")
  end

  it "returns win" do
    input = StringIO.new("1\n4\n2\n5\n7\n6")
    console = Console.new(@output, input)
    display = Display.new(console, @message)
    game = Game.new(display, @board, @player)
    game.play
    expect(@output.string).to include("Player two wins")
  end

  it "returns draw" do
    input = StringIO.new("1\n2\n3\n4\n6\n9\n7\n5\n8")
    console = Console.new(@output, input)
    display = Display.new(console, @message)
    game = Game.new(display, @board, @player)
    game.play
    expect(@output.string).to include("draw")
  end
end
