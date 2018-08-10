require "player"
require "computer_player_random"
require "board"
require "validator"
require "message"
require "display"
require "console"

describe ComputerPlayerRandom do

  before :each do
    grid = (1..9).to_a
    @board = Board.new(grid)
    validator = Validator.new
    message = Message.new
    display = Display.new(message, validator)
    @computer_player = ComputerPlayerRandom.new(@board, display, "")
  end

  it "returns number between 1 and 9" do
    expect(@computer_player.get_cell(@board)).to be_between(1, 9)
  end

  it "returns number 5 given marked board" do
    grid = ["X", "X", "X", "X", 5, "X", "X", "X", "X"]
    board = Board.new(grid)
    validator = Validator.new
    message = Message.new
    display = Display.new(message, validator)
    computer_player = ComputerPlayerRandom.new(board, display, "")
    expect(computer_player.get_cell(board)).to eql(5)
  end
end
