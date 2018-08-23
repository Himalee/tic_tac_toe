require "display"
require "message"
require "board"
require "console"
require "human_player"
require "player"

describe HumanPlayer do

  before :each do
    grid = (1..9).to_a
    @board = Board.new(grid)
    @output = StringIO.new
    @message = Message.new
    @validator = Validator.new
  end

  it "validates cell choice input" do
    input = StringIO.new("hello\n33\n3")
    console = Console.new(@output, input)
    display = Display.new(console, @message, @validator)
    human_player = HumanPlayer.new(@board, display, "")
    expect(human_player.get_cell(@board)).to eql(3)
  end
end
