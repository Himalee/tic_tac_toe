require "display"
require "message"
require "board"
require "console"

describe Display do

  before :each do
    grid = (1..9).to_a
    @board = Board.new(grid)
    @output = StringIO.new
    @message = Message.new
    @validator = Validator.new
  end

  it "presents 3x3 board" do
    console = Console.new(@output)
    display = Display.new(console, @message, @validator)
    display.present_board_with_squares(@board)
    expect(@output.string).to eql(" 1 │ 2 │ 3 \n───┼───┼───\n 4 │ 5 │ 6 \n───┼───┼───\n 7 │ 8 │ 9\n")
  end

  it "validates input to play again" do
    input = StringIO.new("d\n3\nno\nN")
    console = Console.new(@output, input)
    display = Display.new(console, @message, @validator)
    expect(display.valid_play_again_response).to eql("n")
  end

  it "validates game mode input" do
    input = StringIO.new("d\n8\n12\n1")
    console = Console.new(@output, input)
    display = Display.new(console, @message, @validator)
    expect(display.valid_game_mode_response).to eql(1)
  end
end
