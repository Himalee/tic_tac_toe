require "display"
require "message"
require "board"
require "console"
require "human_player"

describe HumanPlayer do

  before :each do
    @board = Board.new(3)
    @output = StringIO.new
    @message = Message.new
    @validator = MoveValidator.new(@board)
  end

  it "validates cell choice input" do
    input = StringIO.new("hello\n33\n3")
    console = Console.new(@output, input)
    display = Display.new(console, @message, @validator)
    human_player = HumanPlayer.new(@board, display, "")
    expect(human_player.get_cell).to eql(3)
  end
end
