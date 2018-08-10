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
    validator = Validator.new(@board)
    message = Message.new
    display = Display.new(message, validator)
    @computer_player = ComputerPlayerRandom.new(@board, display, "")
  end

  it "returns number between 1 and 9" do
    expect(@computer_player.get_cell).to be_between(1, 9)
  end

  it "returns number 5 given marked board" do
    @board.mark_board(1, "X")
    @board.mark_board(2, "X")
    @board.mark_board(3, "X")
    @board.mark_board(4, "X")
    @board.mark_board(6, "X")
    @board.mark_board(7, "X")
    @board.mark_board(8, "X")
    @board.mark_board(9, "X")
    expect(@computer_player.get_cell).to eql(5)
  end
end
